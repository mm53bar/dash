require 'digest/sha2'

module Dash
  class Password
    STRONG = 'ABCDEFGHJKLMNPQRSTUVWabcdefghijkmnopqrstuvw0123456789+/-_*()[]{}'
    WEAK =  'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    LENGTH = 12

    def self.generate(domain, password, weak = false, length = LENGTH)
      key = encrypt password
      hash = encrypt "#{key}#{domain}"
      charset = (weak == true) ? WEAK : STRONG
    
      return encode(hash, charset)[0,length]
    end
  
    def self.encode(s,c)
      (t=s.unpack('C*').inject([0,'',0]){|a,v|a[0]==0?[2,a[1]+c[v>>2,1],v*16&48]:a[0]==2?[4,a[1]+c[v>>4|a[2],1],v*4&60]:[0,a[1]+c[v>>6|a[2],1]+c[v&63,1],0]})[1]+(t[0]==0?'':t[0]==2?c[t[2],1]+'==':c[t[2],1]+'=')
    end
  
    def self.encrypt(key)
      Digest::SHA2.new(256).hexdigest(key || '')
    end
  end
end
