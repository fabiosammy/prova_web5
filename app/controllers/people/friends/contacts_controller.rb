class People::Friends::ContactsController < ApplicationController
  before_action :set_friend, only: [:edit, :update]
  
  def index
    @person = Person.find(params[:person_id])
    @friend = Friend.find(params[:friend_id])
    @contacts = @friend.contacts.all
  end

  def show
    @person = Person.find(params[:person_id])
    @friend = Friend.find(params[:friend_id])
    @contact = @friend.contacts.find(params[:id])
  end

  def new
    @person = Person.find(params[:person_id])
    @friend = Friend.find(params[:friend_id])
    @contact = @friend.contacts.new
  end

  def create
    @person = Person.find(params[:person_id])
    @friend = Friend.find(params[:friend_id])
    @contact = @friend.contacts.new(contact_params)
  
    respond_to do |format|
      if @contact.save
        format.html { redirect_to person_friend_contacts_path, notice: 'Contacts was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @friend.contacts.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to person_friends_path, notice: 'contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @person = Person.find(params[:person_id])
     @friend = @person.friends.find(params[:id])
     @friend.destroy
     redirect_to person_friends_path(@person)
  end

  private
  def set_contact
      @person = Person.find(params[:person_id])
      @friend = Friend.find(params[:friend_id])
      @contact = @friend.contacts.find(params[:id])
    end

  def contact_params
    params.require(:contact).permit(:tipo, :valor)
  end


end
