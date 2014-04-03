require 'screen'

require 'spec_helper'

describe Screen do
  describe ".clear!" do
    subject(:clear!) { klass.clear! }

    it "clears the screen" do
      Screen.unstub :clear!

      Screen.should_receive(:print).with("\e[2J\e[f")

      clear!
    end
  end

  describe ".height" do
    subject(:height) { klass.height }

    it "returns the height" do
      height.should be_nonzero
    end
  end

  describe ".hide_cursor" do
    before do
      klass.unstub :print
    end

    it "prints to the bottom right of the screen" do
      expect(Kernel).to receive(:print) do |string|
        string.match(/\\\e\[\d+;\d+/)
      end

      klass.hide_cursor
    end
  end

  describe ".print" do
    let(:text) { "foo" }

    before do
      klass.unstub :print
    end

    it "prints to the screen" do
      expect(Kernel).to receive(:print).with(text)

      klass.print text
    end
  end

  describe ".width" do
    subject(:width) { klass.width }

    it "returns the width" do
      width.should be_nonzero
    end
  end
end
