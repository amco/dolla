require "dolla/version"
require "savon"

module Dolla
  autoload :CardNumberPrefix, 'dolla/card_number_prefix'
  autoload :PaymentStub, 'dolla/payment_stub'
  autoload :Gateway, 'dolla/gateway'
  autoload :ReferenceNumber, 'dolla/reference_number'
  autoload :Options, 'dolla/options'
  autoload :EndPoints, 'dolla/end_points'
  autoload :Amount, 'dolla/payment_slip/amount'
  autoload :DueDate, 'dolla/payment_slip/due_date'
  autoload :Terms, 'dolla/terms'
  autoload :EncryptionTools, 'dolla/encryption_tools'
  autoload :RequestBuilder, 'dolla/request_builder'
  autoload :CardType, 'dolla/card_type'

  module CardPrefix
    autoload :Amex, 'dolla/card_prefix/amex'
  end
end
