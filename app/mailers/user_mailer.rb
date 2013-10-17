class UserMailer < ActionMailer::Base
  default from: "team@swish.io"

  def welcome_email(user)
    @user = user
    @url  = "http://simple-delivery.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to the future of delivery.')
  end

  def tracking_email(order)
    @order = order
    @url  = "http://simple-delivery.herokuapp.com/track/#{@order.tracking_number}"
    mail(to: @order.email, subject: 'Track your swish.io order.')
  end

  def delivered_email(merchant, courier)
    @merchant = merchant
    @courier = courier
    @url  = "http://simple-delivery.herokuapp.com/users/#{@courier.id}"
    mail(to: @merchant.email, subject: 'Your order has been delivered.')
  end
end