require 'spec_helper'

describe TP do
  describe ".configuration" do
    describe :gutter do
      it "defaults to true" do
        expect(TP.configuration[:gutter]).to be_true
      end

      context "when set to false" do
        before { TP.configuration[:gutter] = false }

        it "is false" do
          expect(TP.configuration[:gutter]).to be_false
        end
      end
    end
  end

  describe ".reset!" do
    it "resets the configuration" do
      TP.reset!

      expect(TP.configuration).to eq(TP::DEFAULTS)
    end
  end
end
