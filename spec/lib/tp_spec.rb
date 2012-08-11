require 'spec_helper'

describe TP::Presenter do
  describe ".present" do
    subject(:present) { klass.present markdown }
    let(:markdown) {
      "# First Slide\n\n* Bullet 1\n* Bullet 2\n\n# Second Slide"
    }

    it "works" do
      klass.should_receive(:print).twice
      klass.should_receive(:puts).twice
      $stdin.should_receive(:gets).twice

      present
    end
  end
end
