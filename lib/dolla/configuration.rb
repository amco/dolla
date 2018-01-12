module Dolla
  class Configuration
    attr_accessor :business_unit, :payment_gateway_code, :cancel_gateway_code, :currency,
    :client_id, :admin_email, :transaction_type, :platform, :payment, :cancellation,
    :rijndael_key, :hmac_key

    def initialize
      @business_unit = nil
      @payment_gateway_code = nil
      @cancel_gateway_code = nil
      @currency = nil
      @client_id = nil
      @admin_email = nil
      @transaction_type = nil
      @platform = nil
      @payment = nil
      @cancellation = nil
      @rijndael_key = nil
      @hmac_key = nil
    end
  end
end
