module Dolla
  class PaymentStub
    include Dolla::Gateway

    attr_reader :attributes

    def initialize opts = {}
      @attributes = {
        payment_id: 100,
        code: 'ABCDE',
        amount: "1.10",
        cvv: "123",
        card_number: "4111111111111111",
        card_expiration: 1.year.from_now,
        name: "Doroteo",
        last_name: 'Arango',
        address: '1911 Columbos',
        email: 'villa@losdorados.com',
        phone_number: '6661231234',
        zip_code: "22000",
        user_agent: 'Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405',
        server_address: '127.0.0.1',
      }.merge!( opts )

      attributes.each do |prop, value|
        send("#{prop}=", value)
      end
    end

    def bank_account_terms
      1
    end

    def card_type
      @card_type ||= FactoryBot.create(:visa_card )
    end

    def card_type_bank_code
      card_type.bank_code
    end

  end
end
