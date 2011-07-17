#lib/gridder/engine.rb

require 'gridder'
require 'rails'

module Gridder
 class Engine < Rails::Engine
    engine_name :gridder
  end
end