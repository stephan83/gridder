require 'helper'
require 'grid_controller'
 
class GridControllerTest < ActionController::TestCase

  def setup
    @controller = Gridder::GridController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    Rails.application.routes.draw do |map|
      mount_at = Grid::Engine.config.mount_at
      match mount_at => 'gridder/grid#show'
    end
  end

  test 'display stylesheet correctly' do
    get :show
    assert_response :success
  end
  
end