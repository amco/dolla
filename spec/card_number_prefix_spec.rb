RSpec.describe Dolla::CardNumberPrefix do
  # let(:class_instance) { (Class.new { include Super::Duper::Module }).new }
  before(:each) do
    @card = described_class.new
  end

  it "#amex?" do
    expect(@card.card_number_is_amex?(36)).to be_true
  end
end
