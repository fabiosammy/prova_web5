class People::PhonesController < ApplicationController
  before_action :set_phone, only: [:edit, :update]

  def index
    @person = Person.find(params[:person_id])
    @phones = @person.phones.all
  end

  def show
    @person = Person.find(params[:person_id])
    @phone = @person.phones.find(params[:id])
  end

  def new
    @person = Person.find(params[:person_id])
    @phone = @person.phones.new
  end

  def create
    @person = Person.find(params[:person_id])
    @phone = @person.phones.new(phone_params)

    
  
    respond_to do |format|
      if @phone.save
        format.html { redirect_to person_phones_path, notice: 'Phone was successfully created.' }
        format.json { render :show, status: :created, location: @phone }
        if (@phone.default)
          @person.phones.where.not(:id => @phone).update_all(:default => false)
        end
      else
        format.html { render :new }
        format.json { render json: @person.phones.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to person_phones_path, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone }
        if (@phone.default)
          @person.phones.where.not(:id => @phone).update_all(:default => false)
        end
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @person = Person.find(params[:person_id])
     @phone = @person.phones.find(params[:id])
     @phone.destroy
     redirect_to person_phones_path(@person)
  end

  private
  def set_phone
      @person = Person.find(params[:person_id])
      @phone = @person.phones.find(params[:id])
    end

  def phone_params
    params.require(:phone).permit(:number, :default)
  end

end
