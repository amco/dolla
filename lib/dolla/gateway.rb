module Dolla
  module Gateway
    include Options
    include EndPoints
    include Terms
    include EncryptionTools

    ACTIONS = {
      :default => {
        :cancel_purchase    => :reverso_tdc_interred,
        :process_purchase   => :procesa_compra_o_l,
      },

      :amex => {
        :process_purchase   => :ins_pago_amex_request
      }
    }.freeze

    delegate :request, to: :payments_gateway

    attr_accessor :payment_id, :code, :amount, :cvv, :card_number, :card_expiration,
                  :cardholder, :phone_number, :name, :last_name, :address, :zip_code,
                  :email, :card_type_bank_code, :user_agent, :server_address, :bank_account_terms

    def pay!
      request soap_action(:process_purchase), :xmlns => xml_namespace do
        soap.element_form_default = :qualified
        soap.body = build_payment_body.to_hash
      end
    end

    def reference valid_timeframe = 1.week
      due_date = valid_timeframe.from_now
      ReferenceNumber.new( due_date: due_date, amount: amount, payment_id: payment_id )
    end

    def payments_gateway
      @client ||= Savon::Client.new do
        wsdl.endpoint   = wsdl_address
        wsdl.namespace  = xml_namespace
      end
    end

    def wsdl_address
      amex? ? get_wsdl_address(:amex) : get_wsdl_address
    end

    def xml_namespace
      amex? ? get_xml_namespace(:amex) : get_xml_namespace
    end

    def soap_action key
      actions = amex? ? ACTIONS[:amex] : ACTIONS[:default]
      actions[key]
    end

    def amex?
      CardNumberPrefix.card_number_is_amex? card_number
    end

    def card_number= value
      @card_number = value.to_s.gsub /\D/, ''
    end

    def full_name
      [name, last_name].join(' ')
    end

    def decimal_amount
      decimal_format( amount )
    end

    def build_payment_body
      amex? ? build_amex_payment_body : build_default_payment_body
    end

    def build_default_payment_body
      body = default_body_fields

      body.set_option :card_type, card_type_bank_code
      body.set_option :transaction_type, TRANSACTION_TYPE
      body.set_option :track, ''
      body.set_option :admin_email, ADMIN_EMAIL
      body.set_option :transaction, PAYMENT
      body.set_option :afiliation, ''
      body.set_option :platform, PLATFORM

      %i/card_sequence interred_sequence signature_flag promissory_code promissory_transaction/.each do |opt|
        body.set_option opt, ''
      end

      body.set_option(:order!, body.keys) # Unfortunately order matters...
    end

    def build_amex_payment_body
      body = default_body_fields

      body.set_option :typed_card, amex_typed_card
      body.set_option :avs_validation, amex_avs_validation
      body.set_option :slid_card, nil
      body.set_option :card_chip, nil

      body.set_option :order!, body.keys
    end

    def amex_avs_validation
      opt = ActiveSupport::OrderedHash.new

      opt[ get_option(:name) ] = name
      opt[ get_option(:surnames) ] = last_name
      opt[ get_option(:zip_code) ] = zip_code
      opt[ get_option(:address) ]  = address
      opt[ get_option(:shipping) ] = nil

      opt
    end

    def amex_typed_card
      opt = ActiveSupport::OrderedHash.new

      opt['operationEnvironment'] = 0 # more static values that we don't know what they are
      opt['cardHolderPresent'] = 'S'
      opt['cardPresent'] = false

      opt[ get_option(:online_purchase) ] = ActiveSupport::OrderedHash.new

      opt[ get_option(:online_purchase) ]['browser'] = user_agent[0..49]
      opt[ get_option(:online_purchase) ]['shipping'] = '05' # plz don't ask me what this means, multipagos just said to set it to this
      opt[ get_option(:online_purchase) ]['productId'] = '0' * 6 # just a placeholder until we get the asset system right
      opt[ get_option(:online_purchase) ][ get_option(:client_ip) ] = server_address
      opt
    end

    def default_body_fields
      encrypted = encrypted_customer_info

      if amex?
        cardholder = :full_name
        currency = :amex_currency
        terms = bank_account_terms > 1 ? bank_account_terms : ''
      end

      cardholder ||= :cardholder
      currency   ||= :currency

      body = RequestBuilder.new

      body.set_option :payment_id, payment_id
      body.set_option :payment_code, code
      body.set_option :business_unit, BUSINESS_UNIT
      body.set_option :service_type, PAYMENT_GATEWAY_CODE
      body.set_option currency, CURRENCY
      body.set_option :total, decimal_amount
      body.set_option cardholder, full_name
      body.set_option :card_number, encrypted[:cc]
      body.set_option :card_expiration, encrypted[:cc_exp]
      body.set_option :cvv, encrypted[:cc_cvv]
      body.set_option :digest, encrypted[:hmac]
      body.set_option :client_email, email
      body.set_option :client_phone, phone_number
      body.set_option :client_id, CLIENT_ID
      body.set_option :payment_plan, payment_plan
      body.set_option :terms, (amex? ? terms : bank_account_terms)
    end

    def encrypted_customer_info
      {
        :hmac    => build_digest( payment_id, code, decimal_amount, cvv ),
        :cc      => rijndael_encrypt( card_number ),
        :cc_exp  => rijndael_encrypt( card_expiration.strftime( '%y%m' ) ),
        :cc_cvv  => rijndael_encrypt( cvv.to_s ),
      }
    end

  end
end
