require 'test_helper'

module Dolla

  class GatewayTest < ActiveSupport::TestCase

    setup do
      assert @payment = Dolla::PaymentStub.new(amount: 200.22)
    end

    test 'payment respond to request' do
      assert @payment.respond_to?(:request)
    end

    test 'payment sets gateway' do
      assert gw = @payment.payments_gateway
      assert_equal @payment.wsdl_address, gw.wsdl.endpoint
      assert_equal @payment.xml_namespace, gw.wsdl.namespace
    end

    test 'wsdl address is from amex' do
      @payment.stub :amex?, true do
        assert_equal EndPoints::TESTING_URL[:amex], @payment.wsdl_address
      end
    end

    test 'wsdl address for none-amex' do
      @payment.stub :amex?, false do
        assert_equal EndPoints::TESTING_URL[:default], @payment.wsdl_address
      end
    end

    test 'xmlnamespace is from amex' do
      @payment.stub :amex?, true do
        assert_equal EndPoints::XML_NAMESPACE[:amex], @payment.xml_namespace
      end
    end

    test 'xmlnamespace for none-amex' do
      @payment.stub :amex?, false do
        assert_equal EndPoints::XML_NAMESPACE[:default], @payment.xml_namespace
      end
    end

    test 'returns soap actions for amex' do
      @payment.stub :amex?, true do
        assert Gateway::ACTIONS[:amex].values.include?( @payment.soap_action(:process_purchase) )
      end
    end

    test 'returns soap actions for visa or mc' do
      @payment.stub :amex?, false do
        assert Dolla::Gateway::ACTIONS[:default].values.include? @payment.soap_action(:process_purchase)
      end
    end

    test 'amex? is true if card_number_is_amex' do
      CardNumberPrefix.stub :card_number_is_amex?, true do
        assert @payment.amex?
      end
    end

    test 'amex? is false when card number is no amex' do
       CardNumberPrefix.stub :card_number_is_amex?, false do
        assert_not @payment.amex?
       end
    end

    test 'full name is name and last name' do
      @payment.stub :name, 'Juana' do
        @payment.stub :last_name, 'Bananas' do
          assert 'Juana Bananas', @payment.full_name
        end
      end
    end

    test 'decimal amount will transform number into decimals' do
      @payment.stub :amount, 666.666 do
        assert "666.66", @payment.decimal_amount
      end
    end

    test 'build payment body will build amex payment body' do
      @payment.stub :amex?, true do
        assert @payment.build_payment_body
      end
    end

    test 'build payment body will build normal body request' do
      @payment.stub :build_payment_body, true do
        @payment.stub :amex?, false do
          assert @payment.build_payment_body
        end
      end
    end

    test 'default body fields' do
      @payment.stub :amex?, false do
        assert_equal default_fields, @payment.default_body_fields.to_hash
      end
    end

    test 'default payment body hash' do
      @payment.stub :amex?, false do
        assert expected = default_fields.merge!( non_amex_fields )
        assert_equal expected.merge(order!: expected.keys), @payment.build_payment_body.to_hash
      end
    end

    test 'Amex payment body hash' do
      @payment.stub :amex?, true do
        assert expected = default_fields( "titular", "c" ).merge!( amex_fields )
        assert_equal expected.merge(order!: expected.keys), @payment.build_payment_body.to_hash
      end
    end

    test 'payment have reference number' do
      new_time =  Time.local(2014, 5, 8, 1, 1, 0)
      Timecop.freeze( new_time )
      assert_equal '0000100013862-45', @payment.reference.number
      Timecop.return
    end

    test 'card number strips none numeric values' do
      @payment.card_number = '4111-1111-1111 1111'
      assert_equal '4111111111111111', @payment.card_number
    end

    test 'card number is converted to string' do
       @payment.card_number = 3711111111111111
       assert @payment.card_number.is_a? String
    end

    private

    def amex_fields
      {
        "tarjetaDigitada" => @payment.amex_typed_card,
        "validacionAVS" => @payment.amex_avs_validation,
        "tarjetaDeslizada" => nil,
        "tarjetaChip" => nil,
        "val_20" => '',
      }
    end

    def non_amex_fields
      assert visa_card = FactoryBot.build(:visa_card)
      {
        "val_16" => visa_card.bank_code,
        "val_17" => ENV['TRANSACTION_TYPE'],
        "val_18" => '',
        "email_admin" => ENV['ADMIN_EMAIL'],
        "accion" => 'PAGO',
        "nu_afiliacion" => '',
        "nu_plataforma" => ENV['PLATFORM'],
        "TAG5F34" => '',
        "TAGSEMV" => '',
        "sFlag" => '',
        "TAG9F26" => '',
        "TAG9F27" => '',
      }
    end

    def default_fields name_field = "tarjetabiente", transaction_type = "t"
      {
        "s_transm" => @payment.payment_id,
        "c_referencia" => @payment.code,
        "val_1" => '0',
        "t_servicio" => '272',
        "#{transaction_type}_cur" => "0",
        "t_importe" => @payment.amount.to_s,
        name_field => @payment.full_name,
        "val_3" => @payment.encrypted_customer_info[:cc],
        "val_4" => @payment.encrypted_customer_info[:cc_exp],
        "val_5" => @payment.encrypted_customer_info[:cc_cvv],
        "val_6" => @payment.encrypted_customer_info[:hmac],
        "val_11" => @payment.email,
        "val_12" => @payment.phone_number,
        "clave_entidad" => "10894",
        "val_19" => 0,
        "val_20" => 1,
      }
    end

  end
end
