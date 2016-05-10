require 'test_helper'

class People::FriendsControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
    @friend = friends(:one)
  end

  test "should get index" do
    get :index, person_id: @person
    assert_response :success
    assert_not_nil assigns(:friends)
  end

  test "should get new" do
    get :new, person_id: @person
    assert_response :success
  end

  test "should create friend" do
    assert_difference('Friend.count') do
      post :create, person_id: @person, friend: { name: "Amanda", person_id: @person}
    end
    assert_redirected_to person_friends_path(assigns(:person))
  end

  # test "should show friend" do
  #   get :show, person_id: @person, id: @friend
  #   assert_response :success
  # end

  test "should get edit" do
    get :edit, person_id: @person, id: @friend
    assert_response :success
  end

  test "should update friend" do
    patch :update, person_id: @person, id: @friend, friend: { name:'Suzana' }
    assert_redirected_to person_friends_path(@person, assigns(:friends))
    assert_equal 'Suzana', Friend.find(@friend.id).name
  end

  test "should destroy friend" do
    assert_difference('Friend.count', -1) do
      delete :destroy, person_id: @person, id: @friend
    end  
  end

end
