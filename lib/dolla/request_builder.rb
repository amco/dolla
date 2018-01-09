module Dolla
  class RequestBuilder
    extend Forwardable
    include Options

    def_delegators :@hash, :[], :[]=, :keys

    def initialize
      @hash = ActiveSupport::OrderedHash.new
    end

    def set_option key, value
      option_key = (key == :order!)? key : get_option( key )
      @hash[ option_key ] = value
      self
    end

    def to_hash
      @hash
    end

  end
end
