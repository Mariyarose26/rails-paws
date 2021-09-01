class DashboardController < ApplicationController
  def dashboard
    @user = current_user
    @pets = current_user.pets
    @bookings = Booking.where(pet: @pets)
    @current_user_bookings = Booking.where(user: current_user)
  end
end