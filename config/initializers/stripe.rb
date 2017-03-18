Rails.configuration.stripe = {
  :publishable_key => 'pk_test_V7NH5XH8azXLOpS2c47gHdLe',
  :secret_key      => 'sk_test_QzuCJpm8CcmtFJjND5CW1SAJ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
