require 'spec_helper'

describe TP::Presenter do
  subject(:presenter) { klass.new markdown }
  let(:markdown) {
    "# First Slide\n\n* Bullet 1\n* Bullet 2\n\n# Second Slide"
  }

  before :each do
    Screen.stub width: 20, height: 20
  end

  describe "#present" do
    it "works" do
      Screen.should_receive(:clear!).twice
      presenter.should_receive(:puts).at_least(:once)
      Keyboard.should_receive(:wait_for_enter).twice

      presenter.present
    end
  end
end
