require 'spec_helper'

describe TP::Slide::Code do
  subject { slide }

  let(:markdown) { "# Code\n\n```rb\nclass Thing\nend\n```" }
  let(:slide) { klass.new markdown }

  before do
    Screen.stub width: 20
  end

  its(:width) { should == 11 }
  its(:height) { should == 4 }

  its(:code) { should == "class Thing\nend\n" }
  its(:language) { should == "ruby" }

  its(:maximum_line_length) { should == 11 }
  its(:prawn_code) { should be_a Array }

  describe "#highlighted_code" do
    subject(:highlighted_code) { slide.highlighted_code }

    it "uses CodeRay" do
      CodeRay.should_receive(:encode).with("class Thing\nend\n", "ruby", :terminal)

      highlighted_code
    end

    context "with no language" do
      let(:markdown) { "# Code\n\n```\nThis is a code block\n```" }

      it "doesn't raise an error" do
        highlighted_code
      end
    end
  end

  describe "#render_terminal" do
    subject(:render_terminal) { slide.render_terminal }

    before do
      slide.stub highlighted_code: "Highlighted code"
    end

    it { should == "Code".center(20) + "\n\n" + "Highlighted code" }
  end
end
