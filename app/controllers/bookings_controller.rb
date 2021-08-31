class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    @user = User.find(@pet.user_id)
    @booking.user = @user
    if @booking.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to pets_path(@pet)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :price)
  end
end
