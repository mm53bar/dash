require 'clamp'
require 'dash/password'

module Dash
  class CLI < Clamp::Command 
    option ["-l", "--length"], "N", "make a password of N length", :default => 12 do |s|
      Integer(s)
    end
    option ["-w", "--weak"], :flag, "generate a weak password"
    parameter "DOMAIN", "the domain that needs a password", :attribute_name => :domain
    parameter "[PASSWORD]", "your master password", :attribute_name => :password

    def execute
      puts Dash::Password.generate(domain, password, weak?, length)
    end  
    
    def default_password
      ENV['DASH_PASSWORD'] || ''
    end
  end
end
