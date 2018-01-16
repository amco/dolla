require 'test_helper'

FactoryBot.define do

  factory :visa_card, class: Dolla::CardType do
    name 'Visa'
    bank_code 1
  end

  factory :mc_card, class: Dolla::CardType do
    name 'MasterCard'
    bank_code 2
  end

  factory :amex_card, class: Dolla::CardType do
    name 'Amex'
    bank_code 3
  end

end
