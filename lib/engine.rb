#lib/gridder/engine.rb

require 'gridder'
require 'rails'

module Gridder
  class Engine < Rails::Engine
    config.mount_at = '/gridder/'
    
    initializer "check config" do |app|
      config.mount_at += '/'  unless config.mount_at.last == '/'
    end
  end
end