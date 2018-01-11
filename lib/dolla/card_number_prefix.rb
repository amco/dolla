module Dolla
  class CardNumberPrefix
    attr_accessor :prefix, :bank

    def self.is_amex
      prefixes = ::Dolla::CardPrefix::Amex::PREFIXES

      prefixes.map do |prefix|
        self.new(prefix: prefix, bank: :amex)
      end
    end

    def self.card_number_is_amex? number
      number.to_s.match /^(34|37)/
    end

  end
end
