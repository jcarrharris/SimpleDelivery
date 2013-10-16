class UserMailer < ActionMailer::Base
  default from: "team@swish.io"

  def welcome_email(user)
    @user = user
    @url  = 'http://simple-delivery.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to the future of delivery.')
  end
end
