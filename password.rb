module Cheeky
  class Password
    
    def self.generate(master, uri)
      encode(master + uri)
    end

    private
    
      def self.encode(clear_string)
        Base62.encode(hash(clear_string))
      end

      def self.hash(clear_string)
        Hasher.hash(clear_string)
      end
  end
end
    
