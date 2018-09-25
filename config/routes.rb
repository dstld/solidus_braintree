SolidusBraintree::Engine.routes.draw do
  resource  :payment_client_token, only: [:create], controller: 'spree/api/braintree_client_token'
end
