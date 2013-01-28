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

      #

      Blank header
    MD
  }

  before :each do
    Keyboard.stub read: :return
    Screen.stub width: 20, height: 20, suggest: nil, hide_cursor: nil
  end

  describe "#present" do
    it "works" do
      Keyboard.should_receive(:wait_for_return).exactly(1).times
      Screen.should_receive(:clear!).exactly(7).times

      presenter.present
    end
  end
end
