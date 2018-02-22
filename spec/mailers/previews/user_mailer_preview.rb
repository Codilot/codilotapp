# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("e.kooijman@gmail.com", "Eve", "Hallihallo")
  end 

   def confirmation_purchase
   	user =  User.all.first
   	product = Product.all.first
    UserMailer.confirmation_purchase(user, product)
   end 

end