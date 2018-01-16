module Dolla
  module Terms
    BANK_FINANCED = 1
    NOT_FINANCED  = 0

    #TODO: when implementing montlhy payments will require
    #to have logic for set if financing is available
    def payment_plan
      bank_account_terms > 1 ? BANK_FINANCED : NOT_FINANCED
    end

  end
end
