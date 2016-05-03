class People::FriendsController < ApplicationController
  before_action :set_friend, only: [:edit, :update]
  def index
    @person = Person.find(params[:person_id])
    @friends = @person.friends.all
  end

  def show
    @person = Person.find(params[:person_id])
    @friend = @person.friends.find(params[:id])
  end

  def new
    @person = Person.find(params[:person_id])
    @friend = @person.friends.new
  end

  def create
    @person = Person.find(params[:person_id])
    @friend = @person.friends.new(friend_params)
  
    respond_to do |format|
      if @friend.save
        format.html { redirect_to person_friends_path, notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @person.friends.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to person_friends_path, notice: 'Person was successfully updated.' }
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
  def set_friend
      @person = Person.find(params[:person_id])
      @friend = @person.friends.find(params[:id])
    end

  def friend_params
    params.require(:friend).permit(:name, :birthday)
  end


end
