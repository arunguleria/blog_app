require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get sigup" do
    get :sigup
    assert_response :success
  end

  test "should get signin" do
    get :signin
    assert_response :success
  end

end
