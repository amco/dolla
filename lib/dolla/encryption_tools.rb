require 'hmac-sha1'
require 'crypt/rijndael'

module Dolla
  module EncryptionTools
    def build_digest *ary
      sha1  = HMAC::SHA1.new Dolla.configuration.hmac_key
      sha1 << ary.join

      sha1.to_s
    end

    def padding(key)
      final_key = "\0" * 16
      key.length.times { |i| final_key[i%16] ^= key[i] }

      final_key
    end

    def rijndael_encrypt( value )
      rijndael = Crypt::Rijndael.new Base64.decode64(Dolla.configuration.rijndael_key), 128
      Base64.encode64( rijndael.encrypt_block( padding value ) ).strip
    end

    def decimal_format value
      sprintf "%0.2f", value
    end

  end
end
