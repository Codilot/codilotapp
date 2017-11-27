class RegistrationsController < Devise::RegistrationsController
  
  def after_sign_up_path_for(resource)
    devise_registrations_confirmation_is_sent_path
  end

  def after_inactive_sign_up_path_for(resource)
    devise_registrations_confirmation_is_sent_path
  end

end