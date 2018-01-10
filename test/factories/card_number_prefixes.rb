require 'test_helper'

FactoryGirl.define do

  factory :card_number_prefix, class: Dolla::CardNumberPrefix do
    sequence(:prefix) { |n| "1#{ '%05i' % n }" }
    bank "hsbc"

    factory :amex_card_prefix do
      sequence(:prefix) { |n| "37#{ '%04i' % n }" }
      bank "amex"
    end
  end

end
