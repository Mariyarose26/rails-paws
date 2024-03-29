class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
    @user = User.find(@pet.user_id)
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking = Booking.where(pet_id: @pet.id).first
    @pet.update(pet_params)
    if @pet.available == "Unavailable"
      @booking.status = 0
      @booking.save
    end
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy
    redirect_to pet_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :pet_type, :description, :photo, :user_id, :available, :available_from, :available_till, :booking_requirements)
  end
end
