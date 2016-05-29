require 'test_helper'

class People::Friends::ContactsControllerTest < ActionController::TestCase
   setup do
   @person = people(:one)
   @friend = friends(:one)
   @contact = contacts(:one)
  end 

  test "should index contact" do
    get :index, person_id: @person, friend_id: @friend
    assert_response :success
  end

  test "should show contact friend" do
    get :show, person_id: @person, friend_id: @friend, id: @contact
    assert_response :success
  end

  test "should new contact friend" do
    get :new, person_id: @person, friend_id: @friend
    assert_response :success
  end

  test "should create contact of friend" do
    assert_difference('Friend.find(@friend.id).contacts.count') do
       post :create, contact: {tipo: 'email'}, friend_id: @friend, person_id: @person
    end
  assert_redirected_to person_friend_contacts_path(@person, @friend)
  end

  test "should edit contact of person" do
    get :edit, person_id: @person, friend_id: @friend, id: @contact
    assert_response :success
  end

  test "should update contact of friend" do
    patch :update, person_id: @person, friend_id: @friend, id: @contact, contact: {tipo: 'email'}
    assert_equal 'email', Contact.find(@contact.id).tipo
    assert_redirected_to person_friend_contacts_path(@person, @friend)
  end

  test "should destroy contact of friend" do
   assert_difference('Friend.find(@friend.id).contacts.count', -1) do
      delete :destroy, person_id: @person, friend_id: @friend, id: @contact 
    end
    assert_redirected_to person_friend_contacts_path(@person, @friend)
  end

end