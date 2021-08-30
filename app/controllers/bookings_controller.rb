class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(params[:user_id])
    @booking.user = @user
    @pet = User.Pet.find(params[:pet_id])
    @booking.pet = @pet
    if @booking.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to users_path(@user)
  end

  private

  def bookmark_params
    params.require(:booking).permit(:start_date, :end_date, :status, :price)
  end
end
