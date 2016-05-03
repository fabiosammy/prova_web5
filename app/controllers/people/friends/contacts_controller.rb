class People::Friends::ContactsController < ApplicationController
  before_action :set_friend
  before_action :set_person
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = @friend.contacts
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    # Tem algum problema ao mandar o parametro type....
    @contact = @friend.contacts.new(contact_params)
    
    respond_to do |format|
      if @contact.save
        format.html { redirect_to person_friend_contacts_path(@person, @friend) }
        format.json { head :no_content }
        format.js
      else
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to person_friend_contacts_path(@person, @friend), notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to person_friends_contacts_path(@person, @friends), notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end  
  end

  private
    def set_friend
      @friend = Friend.find(params[:friend_id])
    end

    def set_person
      @person = Person.find(@friend.person_id)
    end 

    def set_contact
      @contact = @friend.contacts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:value)
    end
end
