# coding: utf-8

require 'test/unit'

begin
  require 'rubygems'
rescue LoadError
end

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'dash/password'

