require 'digest/md5'
require 'digest/sha1'

module Cheeky
  class Hasher
  
    def self.hash(value, method = 'md5')
      case method.upcase
      when 'SHA1'
        return Digest::SHA1.hexdigest(value)
      else
        return Digest::MD5.hexdigest(value)
      end
    end
  end
end
  
