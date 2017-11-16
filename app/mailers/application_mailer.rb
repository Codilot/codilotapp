class ApplicationMailer < ActionMailer::Base
  default from: 'donotreply@moebi.herokuapp.com'
  layout 'mailer'
end
