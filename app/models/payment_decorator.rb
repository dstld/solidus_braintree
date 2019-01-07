Spree::Payment.include SolidusBraintree::PaymentBraintreeNonceConcern
Spree::Payment.include SolidusBraintree::InjectDeviceDataConcern

Spree::Payment.class_eval do
  private
  # ensure merchant_account_id is passed to braintree
  def gateway_options
    super.merge({
      merchant_account_id: ENV.fetch('BRAINTREE_MERCHANT_ACCOUNT_ID')
    })
  end
end
