require 'test_helper'

class People::Friend::ContactsControllerTest < ActionController::TestCase
  setup do
    @friend = friends(:Frind_1)
    @person = people(:Person_1)
    @contact = contacts(:Contact_1)
  end

  test "should get index contacts" do
    get :index, person_id: @person, friend_id: @friend
    assert_response :success
    get :index, person_id: @person, friend_id: @friend, :format => :json
    assert_response :success
  end

  test "should get new contact" do
    get :new, person_id: @person, friend_id: @friend
    assert_response :success
  end


  test "should create friend" do
    assert_difference('Person.find(@person.id).friends.find(@friend.id).contacts.count') do
      post :create, person_id: @person, friend_id: @friend, contact: { type_: 'email', value: 'aa@bb.com' }
    end
    assert_redirected_to person_friend_contact_path(@person,@friend,assigns(:contact))
  end

  test "should edit friend of person" do
    get :edit, person_id: @person, friend_id: @friend, id: @contact
    assert_response :success
  end
end
