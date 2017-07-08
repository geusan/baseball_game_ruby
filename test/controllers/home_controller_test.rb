require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get game3" do
    get :game3
    assert_response :success
  end

  test "should get game4" do
    get :game4
    assert_response :success
  end

  test "should get game5" do
    get :game5
    assert_response :success
  end

end
