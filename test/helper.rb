require File.join(File.dirname(__FILE__), *%w[.. lib boo-box])

require 'rubygems'
require 'test/unit'
require 'redgreen'
require 'shoulda'
require 'rr'

class Test::Unit::TestCase
  include RR::Adapters::TestUnit
end
