module Dolla
  module EndPoints

    XML_NAMESPACE = {
      default: 'http://webservice.interred.adquira.com.mx',
      amex: 'http://adquira.com.mx/amex/schemas',
    }

    PRODUCTION_URL = {
      default: 'https://www.multipagos.com.mx/ProcesaPagosOLW/services/ProcesadorPagos',
      amex: 'https://www.multipagos.com.mx/AmexWS/services/insPagoAmex.wsdl',
    }

    TESTING_URL = {
      default: 'https://www.egbs5.com.mx/ProcesaPagosOLW/services/ProcesadorPagos?WSDL',
      amex: 'https://www.egbs5.com.mx/AmexWS/services/insPagoAmex.wsdl',
    }

    WSDL_ADDRESS = Rails.env.production? ? PRODUCTION_URL : TESTING_URL

    def get_wsdl_address key = nil
      key ? WSDL_ADDRESS[key] : WSDL_ADDRESS[:default]
    end

    def get_xml_namespace key = nil
      key ? XML_NAMESPACE[key] : XML_NAMESPACE[:default]
    end

  end
end
