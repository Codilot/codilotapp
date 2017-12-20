class UserMailer < ApplicationMailer
	default from: 'donotreply@moebi.herokuapp.com'

	def contact_form(email, name, message)
		@message = message
		mail( from: email,
			  to: "e.kooijman@gmail.com",
			  subject: "A new contact form message from #{name}")
	end

	def welcome(user)
		@appname = "möbi"
		mail(to: user.email, 
			 subject: "Welcome to #{@appname}" )
	end
end
