ENV["RAILS_ENV"] = 'test'

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rails'
require 'rails/test_help'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'models', 'gridder'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'controllers', 'gridder'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app', 'helpers', 'gridder'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'gridder'

class ActiveSupport::TestCase
  # fixtures :all
end

class ApplicationController < ActionController::Base
  
end
