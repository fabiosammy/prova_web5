require 'test_helper'

class People::PhonesControllerTest < ActionController::TestCase
   setup do
   @person = people(:one)
   @phone = phones(:one)
 end 

  test "should index phones" do
    get :index, person_id: @person
    assert_response :success
  end

  test "should show phone person" do
    get :show, person_id: @person, id: @phone 
    assert_response :success
  end

  test "should new phone person" do
    get :new, person_id: @person
    assert_response :success
  end

  test "should create phone of person" do
    assert_difference('Person.find(@person.id).phones.count') do
       post :create, phone: {number: '9999887'}, person_id: @person
    end
  assert_redirected_to person_phones_path(@person)
  end

  test "should edit phone of person" do
    get :edit, person_id: @person, id: @phone
    assert_response :success
  end

  test "should update phone of person" do
    patch :update, person_id: @person, id: @phone, phone: {number: '8855755'}
    assert_equal '8855755', Phone.find(@phone.id).number
    assert_redirected_to person_phones_path(@person)
  end

  test "should destroy phone of person" do
   assert_difference('Person.find(@person.id).phones.count', -1) do
      delete :destroy, person_id: @person, id: @phone 
    end
    assert_redirected_to person_phones_path(@person)
  end

end