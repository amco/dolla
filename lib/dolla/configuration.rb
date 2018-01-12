module Dolla
  class Configuration
    attr_accessor :business_unit, :payment_gateway_code, :cancel_gateway_code, :currency,
    :client_id, :admin_email, :transaction_type, :platform, :payment, :cancellation,
    :rijndael_key, :hmac_key
  end
end
