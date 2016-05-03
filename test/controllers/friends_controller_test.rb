require 'test_helper'

class People::FriendsControllerTest < ActionController::TestCase
  setup do
    @friend = friends(:Frind_1)
    @person = people(:Person_1)
  end

  test "should index friends" do
    get :index, person_id: @person
    assert_response :success
    get :index, person_id: @person, :format => :json
    assert_response :success
  end

  test "should get new friend" do
    get :new, person_id: @person
    assert_response :success
  end

  test "should create friend" do
    assert_difference('Person.find(@person.id).friends.count') do
      post :create, person_id: @person, friend: { name: 'Teste' }
    end
    assert_redirected_to person_friend_path(@person,assigns(:friend))
  end

  test "should show friend person" do
    get :show, person_id: @person, id: @friend
    assert_response :success
    get :show, person_id: @person, id: @friend 
    assert_response :success, :format => :json
  end

  test "should edit friend of person" do
    get :edit, person_id: @person, id: @friend
    assert_response :success
  end

  test "should update phone of person" do
    patch :update, person_id: @person, id: @friend, friend: {name: 'ABC'}
    assert_equal 'ABC', Friend.find(@friend.id).name
    assert_redirected_to person_friend_path(@person,@friend)
  end

  test "should destroy friend of person" do
    assert_difference('Person.find(@person.id).friends.count', -1) do
      delete :destroy, person_id: @person, id: @friend
    end
    assert_redirected_to person_friends_path(@person)
  end

end
