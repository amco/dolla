require 'test_helper'
require 'dolla/payment_slip/amount'

class AmountTest < ActiveSupport::TestCase

  setup do
    @amount = Dolla::PaymentSlip::Amount.new( 1515.15 )
  end

  test 'amount gets set with no decimals string' do
    assert_equal "151515", @amount.value
  end

  test 'responds to length method' do
    assert @amount.respond_to?( :length )
  end

  test 'length returns string length' do
     assert_equal 6, @amount.length
  end

  test 'hash build from amount' do
    assert_equal 6, @amount.hash
  end

  test 'hash will change if amount is changed' do
    assert @amount.stubs( :value).returns( "120050" )
    assert_not_equal 6, @amount.hash
  end

end
