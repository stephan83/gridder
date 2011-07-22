require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test 'valid grid should return success status' do
    get '/gridder/grid-12-60-20.css'
    assert_response :success
  end
  
  test 'invalid grid should return bad request' do
    get '/gridder/grid-120-60-20.css'
    assert_response :bad_request
  end
  
end

