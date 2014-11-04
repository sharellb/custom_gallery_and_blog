require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
 setup do
    @photo = photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photos)
  end


  test "should show photo" do
    get :show, id: @photo
    assert_response :success
  end
  
    assert_redirected_to photos_path
  end
end
