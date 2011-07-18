#lib/gridder/engine.rb

require 'gridder'
require 'rails'

module Gridder
  class Engine < Rails::Engine
    initializer 'gridder.helper' do |app|
      ActionView::Base.send :include, GridderHelper
    end
  end
end