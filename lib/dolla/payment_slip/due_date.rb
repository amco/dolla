module Dolla
  module PaymentSlip
    class DueDate
      extend Forwardable

      PAYSLIP_EPOCH_YEAR   = 2014
      PAYSLIP_YEAR_MUTATOR = 372

      PAYSLIP_MONTH_MUTATOR  = 31

      def_delegators :@due_date, :year, :month, :day

      def initialize due_date
        @due_date = due_date
      end

      # TODO: hack temporal
      def hash
        h = mutate_year(year) + mutate_month(month) + mutate_day(day)
        h.to_s.rjust(4, "0")
      end

      private

      def mutate_year year
        ( year - PAYSLIP_EPOCH_YEAR ) * PAYSLIP_YEAR_MUTATOR
      end

      def mutate_month month
        ( month - 1 ) * PAYSLIP_MONTH_MUTATOR
      end

      def mutate_day day
        day - 1
      end

    end

  end
end
