require "dolla/version"

module Dolla
  autoload :CardNumberPrefix, 'dolla/card_number_prefix'
  autoload :PaymentStub, 'dolla/payment_stub'
  autoload :Gateway, 'dolla/gateway'
  autoload :ReferenceNumber, 'dolla/reference_number'
  autoload :Options, 'dolla/options'
  autoload :EndPoints, 'dolla/end_points'
  autoload :Amount, 'dolla/payment_slip/amount'
  autoload :Terms, 'dolla/terms'
  autoload :EncryptionTools, 'dolla/encryption_tools'
end
