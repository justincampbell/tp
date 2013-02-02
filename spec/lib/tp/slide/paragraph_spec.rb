require 'spec_helper'

describe TP::Slide::Paragraph do
  subject { slide }

  let(:markdown) { "# Paragraph\n\nShort paragraph" }
  let(:slide) { klass.new markdown }

  before do
    Screen.stub width: 20
  end

  its(:width) { should == 15 }
  its(:height) { should == 3 }

  describe "#render_terminal" do
    subject(:lines) { slide.render_terminal.lines.to_a }

    it { lines.count.should == 3 }

    it "centers the header" do
      lines[0].should == "Paragraph".center(20) + "\n"
    end

    it "centers short paragraphs" do
      lines[2].should == "Short paragraph".center(20)
    end

    context "with long paragraphs" do
      let(:markdown) { "# Paragraph\n\nThis is a very long paragraph" }

      it "wraps" do
        lines[2].should == "This is a very long\n"
        lines[3].should == "paragraph"
      end
    end
  end
end
