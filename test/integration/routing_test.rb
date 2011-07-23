require 'test_helper'

class RoutingTest < ActionDispatch::IntegrationTest

  include Gridder::GridsHelper

  test 'should route grid stylesheet properly' do
    # TODO: figure out why this doesn't work
    #assert_routing({ :path => grid_stylesheet(12, 60, 20) + '.css' }, {:controller => 'grids', :action => 'show', :id => '12-60-20'})
  end

end