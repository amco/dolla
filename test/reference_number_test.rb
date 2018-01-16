require 'test_helper'

class ReferenceNumberTest < ActiveSupport::TestCase

  setup do
    @params = {
      due_date: Date.civil( 2014, 11, 10 ),
      amount: 4445.0,
      payment_id: 1588257,
    }

    @reference = Dolla::ReferenceNumber.new( @params )
  end

  test 'on new id gets set' do
    assert_equal @params[:payment_id], @reference.id
  end

  test 'on new due_date gets set' do
    assert_equal @params[:due_date], @reference.due_date
  end

  test 'on new amount gets set' do
    assert_equal @params[:amount], @reference.amount
  end

  test 'reference number' do
    assert_equal "1588257031992-76", @reference.number
  end

  test 'amount change and reference is changed' do
    @reference.stub :amount, @params[:amount]+20 do
      assert_not_equal "1588257031992-76", @reference.number
    end
  end

end
