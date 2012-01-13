require 'optparse'
require 'dash/password'

module Dash
  class CLI
    def self.run
      begin
        password = generate_password
      rescue  OptionParser::ParseError,
              OptionParser::InvalidArgument,
              OptionParser::InvalidOption,
              OptionParser::MissingArgument
        puts $!.to_s
        #puts optparse.to_s
        exit
      end      
      
      puts password
    end
    
    def self.generate_password
      options = {}
      optparse = OptionParser.new do|opts|
        # Set a banner, displayed at the top
        # of the help screen.
        opts.banner = "Usage: dash [options] DOMAIN"

        # Define the options, and what they do
        options[:weak] = false
        opts.on( '-w', '--weak', 'Generate a weak password' ) do
          options[:weak] = true
        end

        options[:length] = 12
        opts.on( '-l', '--length N', Integer, 'Make a password of N length' ) do |l|
          options[:length] = l
        end

        options[:password] = ENV['DASH_PASSWORD']
        opts.on( '-p', '--password PASSWORD', 'Your master PASSWORD' ) do |p|
          options[:password] = p
        end

        # This displays the help screen, all programs are
        # assumed to have this option.
        opts.on( '-h', '--help', 'Display this screen' ) do
          return opts
          exit
        end
      end      
      
      optparse.parse!    
      
      domain = ARGV.shift
      return optparse unless domain
      return Dash::Password.generate(domain, options[:password], {:weak => options[:weak], :length => options[:length]}) 
    end
  end
end
