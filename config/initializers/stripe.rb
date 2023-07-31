Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY'],
  :secret_name => ENV['STRIPE_SECRET_NAME'],
  :secret_password => ENV['STRIPE_SECRET_PASSWORD']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
