require 'digest/sha1'
require 'slop'

module Dash
  extend self
  STRONG = 'ABCDEFGHJKLMNPQRSTUVWabcdefghijkmnopqrstuvw0123456789+/-_*()[]{}'
  WEAK =  'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
  LENGTH = 12

  def hash(args)
    return unless parse_args(args)
    
    @key = encrypt @password
    @hash = encrypt "#{@key}#{@domain}"

    puts encode(@hash, @charset)[0,@length]
  end

  def parse_args(args)
    opts = Slop.parse!(args) do
      banner "Usage: dash <domain> [options]"
      on :p, :password, 'Your master password', :argument => true
      on :w, :weak, 'Generate weak password with alphanumeric character set'
      on :l, :length, 'Length of generated password', :argument => true
    end
    
    @charset = opts.weak? ? WEAK : STRONG
    @length = opts.length? ? opts[:length].to_i : LENGTH
    
    unless password = opts[:password] || ENV['DASH_PASSWORD']
      puts opts.help
      return
    end
    
    unless domain = args.shift
      puts opts.help
      return
    end
    
    @password = password.strip
    @domain = domain.strip
    true 
  end
  
  def encode(s,c)
    (t=s.unpack('C*').inject([0,'',0]){|a,v|a[0]==0?[2,a[1]+c[v>>2,1],v*16&48]:a[0]==2?[4,a[1]+c[v>>4|a[2],1],v*4&60]:[0,a[1]+c[v>>6|a[2],1]+c[v&63,1],0]})[1]+(t[0]==0?'':t[0]==2?c[t[2],1]+'==':c[t[2],1]+'=')
  end
  
  def encrypt(key)
    Digest::SHA1.hexdigest key
  end
end
