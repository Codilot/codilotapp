# test/mailers/previews/my_mailer_preview.rb
# Preview all emails at http://localhost:3000/rails/mailers/my_mailer

class AuthenticationMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    AuthenticationMailer.confirmation_instructions(User.first, "faketoken", {})
  end

  def reset_password_instructions
    AuthenticationMailer.reset_password_instructions(User.first, "faketoken", {})
  end

  def unlock_instructions
    AuthenticationMailer.unlock_instructions(User.first, "faketoken", {})
  end
end