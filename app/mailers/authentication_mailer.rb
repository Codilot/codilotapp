class AuthenticationMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include DefaultUrlOptions # default url options under app/concerns/default_url_options.rb
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
end