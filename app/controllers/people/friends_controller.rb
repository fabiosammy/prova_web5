class People::FriendsController < ApplicationController
  before_action :set_person
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def index
    @friends = @person.friends
  end

  def show
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = @person.friends.new(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to person_friends_path(@person), notice: 'Friend was successfully created.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
        format.js {render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to person_friends_path(@person), notice: 'Friend was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to person_friends_path(@person), notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private 
    def set_person
      @person = Person.find(params[:person_id])
    end 

    def set_friend
      @friend = @person.friends.find(params[:id])
    end

    def friend_params
      params.require(:friend).permit(:name, :birthday)
    end
end
