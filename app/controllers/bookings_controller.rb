class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @pet = Pet.find(params[:pet_id])
  end

  def show
    @booking = Booking.find(params[:id])
    @sitter = User.find(@booking.user_id)
    @pet = Pet.find(@booking.pet_id)
    @owner = User.find(@pet.user_id)
  end

  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    @user = current_user
    @booking.user_id = @user.id
    if @booking.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @pet = @booking.pet
    @booking.update(booking_params)
    if @booking.status == "approved"
      @pet.available = 2
      @pet.save
    end

    if @booking.status == "pending" || @booking.status == "denied"
      @pet.available = 0
      @pet.save
    end
  redirect_to dashboard_path
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
