# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("e.kooijman@gmail.com", "Eve", "Hallihallo")
  end 

   def welcome
   	user =  User.all.first
    UserMailer.welcome(user)
  end 
end