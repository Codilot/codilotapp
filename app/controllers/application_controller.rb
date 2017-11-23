class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  #redirect  after succesful login
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
