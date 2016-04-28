require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get status:string" do
    get :status:string
    assert_response :success
  end

  test "should get username:string" do
    get :username:string
    assert_response :success
  end

  test "should get birthday:date" do
    get :birthday:date
    assert_response :success
  end

  test "should get bio:text" do
    get :bio:text
    assert_response :success
  end

end
