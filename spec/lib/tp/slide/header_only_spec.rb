require 'spec_helper'

describe TP::Slide::HeaderOnly do
  subject { slide }

  let(:markdown) { "# Header" }
  let(:slide) { klass.new markdown }

  before do
    Screen.stub width: 20
  end

  its(:width) { should == 6 }
  its(:height) { should == 1 }

  describe "#render_terminal" do
    subject(:lines) { slide.render_terminal.lines.to_a }

    it { lines.count.should == 1 }

    it "centers the header" do
      lines[0].should == "Header".center(20)
    end
  end
end
