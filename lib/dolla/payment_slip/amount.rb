module Dolla
  module PaymentSlip
    class Amount
      attr_reader :value

      delegate :length, to: :value

      def initialize number
        @value = format_amount number
      end

      def hash
        filler_string = "".ljust( length, "731" ).reverse
        (0..length-1).inject(0) do |sum, position|
          sum + value[ position, 1 ].to_i * filler_string[ position, 1 ].to_i
        end % 10
      end

      private

      def format_amount number
        "%d" % ( number * 100 ).round
      end

    end
  end
end
