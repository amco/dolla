module Dolla
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "This generator creates an initializer file at config/initializers"
      source_root File.expand_path("../../templates", __FILE__)

      def copy_initializer
        template "dolla_initializer.rb", "config/initializers/dolla.rb"

        puts "Install complete! Please make sure to set following ENV variables!"
        puts "ENV['BUSINESS_UNIT'] = <number>"
        puts "ENV['PAYMENT_GATEWAY_CODE'] = <number>"
        puts "ENV['CANCEL_GATEWAY_CODE'] = <number>"
        puts "ENV['CURRENCY'] = <number>"
        puts "ENV['CLIENT_ID'] = <number>"
        puts "ENV['ADMIN_EMAIL'] = <string>"
        puts "ENV['TRANSACTION_TYPE'] = <number>"
        puts "ENV['PLATFORM'] = <number>"
        puts "ENV['PAYMENT'] = <string>"
        puts "ENV['CANCELLATION'] = <string>"
        puts "ENV['RIJNDAEL_KEY'] = <string>"
        puts "ENV['HMAC_KEY'] = <string>"
      end
    end
  end
end
