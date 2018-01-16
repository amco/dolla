require 'test_helper'
require 'dolla/payment_slip/due_date'

class DueDateTest < ActiveSupport::TestCase

  setup do
    @expected_date = Date.civil( 2014, 11, 10 )
    @date = Dolla::PaymentSlip::DueDate.new( @expected_date )
  end

  test 'due date have year method' do
    assert_equal 2014, @date.year
  end

  test 'due date have month method' do
    assert_equal 11, @date.month
  end

  test 'due date have day method' do
    assert_equal 10, @date.day
  end

  test 'get hash from fate' do
    assert_equal "0319", @date.hash
  end

end
