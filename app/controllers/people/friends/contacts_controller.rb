class People::Friends::ContactsController < ApplicationController
  before_action :set_friend
  before_action :set_person

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
    @contact.save
    redirect_to person_friend_contact_path(@person, @friend, @contact)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_friend
      @friend = Friend.find(params[:friend_id])
    end

    def set_person
      @person = Person.find(@friend.person_id)
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:value)
    end
end
