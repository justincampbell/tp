require 'spec_helper'

describe String do
  describe "#wrap" do
    let(:string) { "One two three four five" }

    it { string.wrap(1).should == "One\ntwo\nthree\nfour\nfive" }
    it { string.wrap(10).should == "One two\nthree four\nfive" }

    context "when wrapping at 0" do
      it "wraps at 1" do
        string.wrap(0).should == "One\ntwo\nthree\nfour\nfive"
      end
    end
  end
end

require 'mrproper'

properties String do
  data [String, Integer]

  property '#wrap' do |string, wrap_at|
    result = string.wrap(wrap_at)

    assert_not_empty result
    assert result.length == string.length
  end
end
