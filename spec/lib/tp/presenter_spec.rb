require 'spec_helper'

describe TP::Presenter do
  subject(:presenter) { klass.new markdown }

  let(:markdown) {
    <<-MD.gsub(/^ {6}/, '')
      # Header by itself

      # Bullets

      * Bullet 1
      * Bullet 2

      # Paragraph

      This is a really long paragraph. Kinda.
    MD
  }

  before :each do
    Screen.stub width: 20, height: 20, suggest: nil
  end

  describe "#present" do
    it "works" do
      Keyboard.should_receive(:wait_for_return).exactly(4).times
      Screen.should_receive(:clear!).exactly(4).times

      presenter.should_receive(:print).exactly(3).times

      presenter.present
    end
  end
end
