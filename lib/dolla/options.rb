module Dolla
  module Options

    OPTS = {
      payment_id: 's_transm',
      payment_code: 'c_referencia',
      business_unit: 'val_1',
      service_type: 't_servicio',
      currency: 't_cur',
      total: 't_importe',
      cardholder: 'tarjetabiente',  # No, this is not a typo that's how it's spelled in their documentation and WSDL
      card_number: 'val_3',
      card_expiration: 'val_4',
      cvv: 'val_5',
      digest: 'val_6',          # 160-bit HMAC SHA-1 (payment_id + payment_reference + total + cvv).
      client_email: 'val_11',
      client_phone: 'val_12',
      client_id: 'clave_entidad',
      card_type: 'val_16',         # 1 visa, 2 mastercard, 3 Amex
      transaction_type: 'val_17',         # 0 typed, 1 slided
      track: 'val_18',         # Only if transaction_type is 1
      payment_plan: 'val_19',
      terms: 'val_20',
      admin_email: 'email_admin',
      transaction: 'accion',
      afiliation: 'nu_afiliacion',
      platform: 'nu_plataforma',
      card_sequence: 'TAG5F34',
      interred_sequence: 'TAGSEMV',
      signature_flag: 'sFlag',
      promissory_code: 'TAG9F26',
      promissory_transaction: 'TAG9F27',
      authorization: 'cd_autorizacion',

      # From this point it's all AMEX specific the reason behind why this isn't under an :amex key
      # is because 1) order matters, 2) we have 3 levels of nesting in all AMEX requests

      avs_validation: 'validacionAVS',
      typed_card: 'tarjetaDigitada',
      slid_card: 'tarjetaDeslizada',
      card_chip: 'tarjetaChip',
      online_purchase: 'compraRemotaCliente',
      name: 'nombreTitular',
      surnames: 'apellidosTitular',
      full_name: 'titular',
      zip_code: 'codigoPostal',
      address: 'direccion',
      shipping: 'datosEnvio',
      client_ip: 'ipCliente',
      amex_currency: 'c_cur',
    }.freeze

    def get_option key
      OPTS[key]
    end

  end
end
