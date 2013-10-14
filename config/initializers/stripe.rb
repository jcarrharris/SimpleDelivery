Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_SsFATVphZJ5x5MVJLqjHYTeN'],
  :secret_key      => ENV['sk_test_J6vpDy27eQ9NdlKu2WtEXjRB']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]