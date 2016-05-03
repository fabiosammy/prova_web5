class People::PhonesController < ApplicationController
  before_action :set_person
  before_action :set_phone, only: [:show, :edit, :update, :destroy]

  def index
    @phones = @person.phones
  end

  def show
  end

  def new
    @phone = Phone.new
  end

  def create
    @phone = @person.phones.new(phone_params)

    respond_to do |format|
      if @phone.save
        #if (@phone.default) @person.phones.where.not(:id => @phone).update_all(:default => false) end
        format.html { redirect_to person_phones_path(@person), notice: 'Phone was successfully created.' }
        format.json { render :no_content }
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
      if @phone.update(phone_params)
        #if (@phone.default) @person.phones.where.not(:id => @phone).update_all(:default => false) end
        format.html { redirect_to person_phones_path(@person), notice: 'Phone was successfully updated.' }
        format.json { render :no_content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to person_phones_path(@person), notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  # Escopo somente da classe.
    def set_person
      @person = Person.find(params[:person_id])
    end

    def set_phone
      @phone = @person.phones.find(params[:id])
    end

    def phone_params
      params.require(:phone).permit(:number, :default)
    end


end
