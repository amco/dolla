require 'minitest/autorun'
require 'dolla'

describe Dolla do
  describe "test dolla version" do
    it "must have a version" do
      Dolla::VERSION.wont_be_nil
    end
  end
end
