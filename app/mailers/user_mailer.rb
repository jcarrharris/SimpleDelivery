class UserMailer < ActionMailer::Base
  default from: "team@swish.io"

  def welcome_email(user)
    @user = user
    @url  = "http://simple-delivery.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to the future of delivery.')
  end

  def tracking_email(order)
    @order = order
    @url  = "http://localhost:3000/track/#{@order.tracking_number}"
    mail(to: @order.email, subject: 'Track your swish.io order.')
  end
end