require 'test_helper'

FactoryBot.define do

  factory :visa_card do
    name 'Visa'
    bank_code 1
  end

  factory :mc_card do
    name 'MasterCard'
    bank_code 2
  end

  factory :amex_card do
    name 'Amex'
    bank_code 3
  end

end
