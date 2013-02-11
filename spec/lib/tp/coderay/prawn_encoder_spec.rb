require 'spec_helper'

describe PrawnEncoder do
  subject { prawn_encoder }
  let(:prawn_encoder) { klass.new }

  let(:options) { {} }

  before do
    prawn_encoder.setup(options)
  end

  it "builds a prawn token" do
    prawn_encoder.begin_group(:comment)
    prawn_encoder.text_token("# test", nil).should == [{
      text: "# test",
      color: klass::COLORS[:comment]
    }]
    prawn_encoder.end_group(:comment)
  end
end
