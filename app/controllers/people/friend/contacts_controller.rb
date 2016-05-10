class People::Friend::ContactsController < ApplicationController
  before_action :set_friend_and_friend, only: [:index,:new,:show, :create,:edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = @friend.contacts.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = @friend.contacts.find(params[:id])
  end

  # GET /contacts/new
  def new
    @contact = @friend.contacts.new
  end

  # GET /contacts/1/edit
  def edit
    @contact = @friend.contacts.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = @friend.contacts.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to person_friend_contact_path(@person,@friend,@contact.id), notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    @contact = @friend.contacts.find(params[:id])
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to person_friend_contact_path(@person,@friend,@contact.id), notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = @friend.contacts.find(params[:id])
    @contact.destroy
    
    respond_to do |format|
      format.html { redirect_to person_friend_contacts_path(@person,@friend), notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_and_friend
      @person = Person.find(params[:person_id]);
      @friend = @person.friends.find(params[:friend_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:type_, :value)
    end
end
