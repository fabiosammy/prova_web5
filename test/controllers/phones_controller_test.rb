require 'test_helper'

class People::PhonesControllerTest < ActionController::TestCase
   setup do
   @person = people(:Person_1)
   @phone = phones(:Phone_1)
 end 

  test "should index phones" do
    get :index, person_id: @person
    assert_response :success
    get :index, person_id: @person, :format => :json
    assert_response :success
  end

  test "should get new phone" do
    get :new, person_id: @person
    assert_response :success
  end

  test "should create phone" do
    assert_difference('Person.find(@person.id).phones.count') do
      post :create, person_id: @person, phone: { number: "+55(999) 22255-7777", default: false }
    end
    assert_redirected_to person_phone_path(@person,assigns(:phone))
  end


  test "should show phone person" do
    get :show, person_id: @person, id: @phone 
    assert_response :success
    get :show, person_id: @person, id: @phone 
    assert_response :success, :format => :json
  end


  test "should edit phone of person" do
    get :edit, person_id: @person, id: @phone
    assert_response :success
  end


  test "should update phone of person" do
    patch :update, person_id: @person, id: @phone, phone: {number: '+55(999) 22255-6363'}
    assert_equal '+55(999) 22255-6363', Phone.find(@phone.id).number
    assert_redirected_to person_phone_path(@person,@phone)
  end

  test "should destroy phone of person" do
   assert_difference('Person.find(@person.id).phones.count', -1) do
      delete :destroy, person_id: @person, id: @phone 
    end
    assert_redirected_to person_phones_path(@person)
  end


end
