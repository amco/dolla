require 'payment_slip/amount'
require 'payment_slip/due_date'

module Dolla
  class ReferenceNumber
    include Rails.application.routes.url_helpers

    attr_reader :request, :id, :due_date, :amount

    REFERENCE_NUMBER_FORMAT = { initial: '%07d%s%d%d', final: '%s-%02d' }.freeze
    BANK_FILLER = %w/11 13 17 19 23/.freeze

    delegate :length, to: :ref

    def initialize(payment_id:, due_date:, amount:)
      @id = payment_id
      @due_date = due_date
      @amount = amount
    end

    def number
      final_reference_number_format % [ref, ref_hash]
    end

    private

    def ref
      initial_reference_number_format % [id, hash_date, hash_amount, 2]
    end

    def ref_hash
      numbers_container = []

      BANK_FILLER.cycle do |filler|
        numbers_container << filler
        break if  numbers_container.length >= length
      end

      numbers_container.reverse!

      (0..length-1).inject(0) do |sum, position|
        sum += (ref[ position, 1 ].to_i * numbers_container[ position ].to_i)
      end % 97 + 1
    end

    def hash_date
      PaymentSlip::DueDate.new( due_date ).hash
    end

    def hash_amount
      PaymentSlip::Amount.new( amount ).hash
    end

    def initial_reference_number_format
      REFERENCE_NUMBER_FORMAT[:initial]
    end

    def final_reference_number_format
      REFERENCE_NUMBER_FORMAT[:final]
    end

  end
end
