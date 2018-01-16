module Dolla
  class CardNumberPrefix
    attr_accessor :prefix, :bank

    def initialize(args = {})
      @prefix = args[:prefix]
      @bank = args[:bank]
    end

    def self.is_amex
      prefixes = ::Dolla::CardPrefix::Amex::PREFIXES

      prefixes.map do |prefix|
        new(prefix: prefix, bank: :amex)
      end
    end

    def self.card_number_is_amex? number
      number.to_s.match /^(34|37)/
    end

  end
end
