module Dolla
  class CardNumberPrefix < ActiveRecord::Base

    symbolize :bank, in: %i/hsbc bancomer banamex amex scotia santander/

    scope :with_prefix, ->( card_number ) { where( prefix: card_number.to_s[0..5] )  }
    scope :is_amex, -> { where( bank: :amex ) }
    scope :card_number_is_amex, ->(card_number) { is_amex.with_prefix( card_number ) }

    def self.card_number_is_amex? number
      number.to_s.match /^(34|37)/
    end

  end
end
