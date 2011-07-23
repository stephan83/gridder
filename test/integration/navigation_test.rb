require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  #fixtures :all

  include Gridder::GridsHelper

  test 'valid grid should return success status' do
    get grid_stylesheet(12, 60, 20) + '.css'
    assert_response :success
  end

  test 'invalid grid should return not acceptable' do
    get grid_stylesheet(120, 60, 20) + '.css'
    assert_response :not_acceptable
  end

  test 'example grid should return success status' do
    get '/grid/index'
    assert_response :success
  end

end

