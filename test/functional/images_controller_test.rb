require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "index should assign images" do
    get :index 
    assert assigns(:images)
  end

end
