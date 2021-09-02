class DashboardController < ApplicationController
  def dashboard
    @user = current_user
    @pets = current_user.pets
    # Owner
    @ownerbookings = Booking.where(pet: @pets)
    # Sitter
    @bookings = Booking.where(user: @user)
  end
end
