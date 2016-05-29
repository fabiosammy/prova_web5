require 'test_helper'

class People::FriendsControllerTest < ActionController::TestCase
   setup do
   @person = people(:one)
   @friend = friends(:one)
  end 

  test "should index friend" do
    get :index, person_id: @person
    assert_response :success
  end

  test "should show friend person" do
    get :show, person_id: @person, id: @friend 
    assert_response :success
  end

  test "should new friend person" do
    get :new, person_id: @person
    assert_response :success
  end

  test "should create friend of person" do
    assert_difference('Person.find(@person.id).friends.count') do
       post :create, friend: {name: 'JOse'}, person_id: @person
    end
  assert_redirected_to person_friends_path(@person)
  end

  test "should edit friend of person" do
    get :edit, person_id: @person, id: @friend
    assert_response :success
  end

  test "should update friend of person" do
    patch :update, person_id: @person, id: @friend, friend: {name: '8855755', birthday: '2016-03-35'}
    assert_equal '8855755', Friend.find(@friend.id).name
    assert_redirected_to person_friends_path(@person)
  end

  test "should destroy friend of person" do
   assert_difference('Person.find(@person.id).friends.count', -1) do
      delete :destroy, person_id: @person, id: @friend 
    end
    assert_redirected_to person_friends_path(@person)
  end

end