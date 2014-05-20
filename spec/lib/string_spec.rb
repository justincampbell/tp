require 'spec_helper'

describe String do
  describe "#wrap" do
    let(:string) { "One two three four five" }

    it { string.wrap(1).should == "One\ntwo\nthree\nfour\nfive" }
    it { string.wrap(10).should == "One two\nthree four\nfive" }

    context "with multiple lines" do
      let(:string) { "One two\nthree four\nfive" }

      it { string.wrap(1).should == "One\ntwo\nthree\nfour\nfive" }
      it { string.wrap(10).should == "One two\nthree four\nfive" }
      it { string.wrap(100).should == string }
    end
  end
end
