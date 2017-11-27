class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

<<<<<<< HEAD
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
  
=======

  #redirect  after succesful login
  # def after_sign_in_path_for(resource)
  #   static_pages_dining_path
  # end
>>>>>>> master
end
