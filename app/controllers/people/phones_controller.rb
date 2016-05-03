class People::PhonesController < ApplicationController
  before_action :set_person, only: [:index, :new, :create,:show, :edit, :update, :destroy]

    def index
		@phones = @person.phones.all
    end

    def show
        @phone = @person.phones.find(params[:id])
    end

    def new
		@phone =  @person.phones.new
    end

    def create
        @phone = @person.phones.new(phone_params)
        Phone.transaction do
            if (@phone.default)
                @person.phones.where.not(:id => @phone).update_all(:default => false)
            end
            respond_to do |format|
                if @phone.save
                    format.html { redirect_to person_phone_path(@person,@phone), notice: 'Phone was successfully created.' }
                    format.json { render :show, status: :created, location: @phone }
                else 
                    format.html { render :new }
                    format.json { render json: @phone.errors, status: :unprocessable_entity }
                end
            end
        end
    end

    def edit
        @phone = @person.phones.find(params[:id])
    end

    def update
        @phone = @person.phones.find(params[:id])
        Phone.transaction do
            respond_to do |format|
                if  @phone.update(phone_params)
                    if (@phone.default)
                        @person.phones.where.not(:id => @phone).update_all(:default => false)
                    end
                    format.html { redirect_to person_phone_path(@person,@phone), notice:  'Phone was successfully updated.' }
                    format.json { render :show, status: :created, location: @phone }
                else 
                    format.html { render :edit }
                    format.json { render json: @phone.errors, status: :unprocessable_entity }
                end
            end
        end
    end

    def destroy
        @phone = @person.phones.find(params[:id])
        @phone.destroy
    
        respond_to do |format|
            format.html { redirect_to person_phones_path(@person), notice: 'Phone was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
  
    private  
  
        def set_person
            @person = Person.find(params[:person_id])
        end

        def phone_params
            params.require(:phone).permit(:number,:default)
        end

end
