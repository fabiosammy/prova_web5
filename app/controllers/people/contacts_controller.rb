class People::ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update]
  def index
      @person = Person.find(params[:person_id])
      @friend = @person.friends.find(params[:friend_id])
      @contacts = @friend.contacts.all
    end

    def show
      @person = Person.find(params[:person_id])
      @friend = @person.friends.find(params[:friend_id])
      @contact = @friend.contacts.find(params[:id])
    end

    def new
      @person = Person.find(params[:person_id])
      @friend = @person.friends.find(params[:friend_id])
      @contact = @friend.contacts.new
    end

    def create
      @person = Person.find(params[:person_id])
      @friend = @person.friends.find(params[:friend_id])
      @contact = @friend.contacts.new(contact_params)
      @contact.save
      redirect_to person_friend_path(@person, @friend)
    end

    def edit
    end
    def update
    end

    private
    def set_contact
      @person = Person.find(params[:person_id])
      @friend = @person.friends.find(params[:friend_id])
      @contact = @friend.contacts.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:tipo, :valor)
    end
end
