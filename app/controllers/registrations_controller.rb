class RegistrationsController < Devise::RegistrationsController
  # Alter the route once the user sign's up
  def after_sign_up_path_for(resource)
    stored_location_for(resource) || user_path(resource)
  end
end
