require 'digest/sha2'

module Dash
  STRONG = 'ABCDEFGHJKLMNPQRSTUVWabcdefghijkmnopqrstuvw0123456789+/-_*()[]{}'
  ALPHA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

  def self.hash(args)
    if args.delete('--alpha')
      charset = ALPHA
    else
      charset = STRONG
    end
    domain = args.shift.strip
    master = (args.shift || ENV['DASHMASTER']).strip

    key = Digest::SHA2.hexdigest master
    password = Digest::SHA2.hexdigest "#{key}#{domain}"

    puts encode(password, charset)[0,12]
  end

  def self.encode(s,c);(t=s.unpack('C*').inject([0,'',0]){|a,v|a[0]==0?[2,a[1]+c[v>>2,1],v*16&48]:a[0]==2?[4,a[1]+c[v>>4|a[2],1],v*4&60]:[0,a[1]+c[v>>6|a[2],1]+c[v&63,1],0]})[1]+(t[0]==0?'':t[0]==2?c[t[2],1]+'==':c[t[2],1]+'=');end
end
