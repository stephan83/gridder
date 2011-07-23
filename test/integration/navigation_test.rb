require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  #fixtures :all

  test 'valid grid should return success status' do
    get '/gridder/grids/12_60_20.css'
    assert_response :success
  end
  
  test 'invalid grid should return not acceptable' do
    get '/gridder/grids/120_60_20.css'
    assert_response :not_acceptable
  end
  
  test 'example grid should return success status' do
    get '/grid/index'
    assert_response :success
  end
  
end

