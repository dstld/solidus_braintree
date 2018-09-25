SolidusBraintree::Engine.routes.draw do
  resource  :payment_client_token, only: [:create], controller: 'braintree_client_token'
end
