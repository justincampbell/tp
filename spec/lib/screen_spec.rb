require 'screen'

require 'spec_helper'

describe Screen do
  describe ".add_gutter" do
    subject(:add_gutter) { klass.add_gutter(text) }

    let(:text) { "  Header  " }

    before do
      klass.stub width: 10
    end

    it "adds a gutter on the top and left" do
      expect(add_gutter).to eq("\n    Header  ")
    end

    context "with a paragraph slide" do
      let(:text) { "  Header  \n\nAbc" }
      it "indents the text and leaves a space on the right" do
        expect(add_gutter).to eq("\n    Header  \n\n  Abc")
      end
    end
  end

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

    before { klass.unstub :height }

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

  describe ".suggest" do
    it "prints the slide size with gutter" do

    end
  end

  describe ".width" do
    subject(:width) { klass.width }

    before { klass.unstub :width }

    it "returns the width" do
      width.should be_nonzero
    end
  end
end
