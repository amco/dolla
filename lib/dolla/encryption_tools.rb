require 'hmac-sha1'
require 'crypt/rijndael'

module Dolla
  module EncryptionTools
    #TODO: Move to a config file.
    RIJNDAEL = "\x52\x3f\x60\x3a\x23\x2a\x2d\xb4\xd6\x2e\xda\xf0\xb5\xa9\xe5\x73".freeze
    HMAC_KEY = 'MguLlotbiapLaAgdomsiBnaInsctoNmeeTr20x12'.freeze


    def build_digest *ary
      sha1  = HMAC::SHA1.new HMAC_KEY
      sha1 << ary.join

      sha1.to_s
    end

    def padding(key)
      final_key = "\0" * 16
      key.length.times { |i| final_key[i%16] ^= key[i] }

      final_key
    end

    def rijndael_encrypt( value )
      rijndael = Crypt::Rijndael.new RIJNDAEL, 128
      Base64.encode64( rijndael.encrypt_block( padding value ) ).strip
    end

    def decimal_format value
      sprintf "%0.2f", value
    end

  end
end
