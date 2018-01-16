require 'test_helper'

module Dolla
  class CardNumberPrefixTest < ActiveSupport::TestCase

    setup do
      assert @amex_objects = 3.times.map{ FactoryBot.build :amex_card_prefix }
      assert other = 2.times{  FactoryBot.build :card_number_prefix }
    end

    test 'with prefixes can handle numeric values' do
      @amex_objects.each do |card_number_prefix|
        assert card_number = "#{card_number_prefix.prefix}#{card_number_trail}".to_i
        assert CardNumberPrefix.card_number_is_amex?( card_number )
      end
    end

    test 'amex card numbers can be match by prefix' do
      @amex_objects.each do |card_number_prefix|
        assert card_number = "#{card_number_prefix.prefix}#{card_number_trail}"
        assert CardNumberPrefix.card_number_is_amex?( card_number )
      end
    end

    private

    def card_number_trail
      @r ||= Random.new
      @r.rand(1000000000...9999999999)
    end

  end
end
