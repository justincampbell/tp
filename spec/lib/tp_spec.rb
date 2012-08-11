require 'spec_helper'

describe TP::Presenter do
  subject(:presenter) { klass.new markdown }
  let(:markdown) {
    "# First Slide\n\n* Bullet 1\n* Bullet 2\n\n# Second Slide"
  }

  describe "#present" do
    it "works" do
      presenter.should_receive(:print).twice
      presenter.should_receive(:puts).twice
      $stdin.should_receive(:gets).twice

      presenter.present
    end
  end
end
