require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:Person_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { name: "André Gomes", status: "online", username: "andregms", birthday: "2016-05-01", bio: "I'm andre" }
    end
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end
    assert_redirected_to people_path
  end
end
