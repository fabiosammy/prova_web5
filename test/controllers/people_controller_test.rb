require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
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

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { name: 'Leticia', status: 'online', birthday: Date.today, username: 'leticia', bio: 'Dentista' }
    end
    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person, format: :xhr
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @person, person: { name: 'Person Changed', status: 'online', usarname: 'person' }
    assert_redirected_to person_path(assigns(:person))
    assert_equal 'Person Changed', Person.find(@person.id).name
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end
  end

end
