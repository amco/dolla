require "dolla/configuration"
require "dolla/version"
require "savon"

module Dolla
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

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
