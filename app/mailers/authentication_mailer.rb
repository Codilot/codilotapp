class AuthenticationMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include DefaultUrlOptions # default url options under app/concerns/default_url_options.rb
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def confirmation_instructions(record, token, options={})
   # Use different e-mail templates for signup e-mail confirmation 
   #   and for when a user changes e-mail address.
   @appname = "möbi"
   if record.pending_reconfirmation?
     options[:template_name] = 'reconfirmation_instructions'
   else
     options[:template_name] = 'confirmation_instructions'
   end
   super
  end


end
