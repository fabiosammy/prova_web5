class People::FriendsController < ApplicationController
  before_action :set_person, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = @person.friends.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = @person.friends.find(params[:id])
  end

  # GET /friends/new
  def new
    @friend = @person.friends.new
  end

  # GET /friends/1/edit
  def edit
    @friend = @person.friends.find(params[:id])
  end

  # POST /friends
  # POST /friends.json
  def create

    @friend = @person.friends.new(friend_params)
    @friend.save

    respond_to do |format|
      if @friend.save
        format.html { redirect_to person_friend_path(@person,@friend), notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    @friend = @person.friends.find(params[:id])
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to person_friend_path(@person,@friend), notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend = @person.friends.find(params[:id])
    @friend.destroy
    redirect_to person_friends_path(@person)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:person_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:name, :birthday, :person_id)
    end
end
