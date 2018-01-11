module Dolla
  class CardType
    PREFIXES = {
      1 => [ 4 ], #Bank code for VISA
      2 => [ *51..55 ], #Bank code for MC
      3 => [ 34, 37 ], #Bank code for AMEX
    }

    attr_accessor :name, :bank_code

    def initialize(args = {})
      @name = args[:name]
      @bank_code = args[:bank_code]
    end

    def self.card_code_for_number number
      codes = self.all.map do |card_type|
        PREFIXES[ card_type.bank_code ].map { |prefix| card_type if number =~ /\A#{ prefix }/ }
      end.flatten.compact.uniq.last
    end

  end
end
