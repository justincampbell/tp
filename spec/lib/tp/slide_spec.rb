require 'spec_helper'

describe TP::Slide do
  subject(:slide) { klass.new markdown }

  let(:markdown) {
    "# First Slide\n\nThis is a slide with a paragraph"
  }

  its(:markdown) { should == markdown }

  its(:header) { should == "First Slide" }
  its(:content) { should == "This is a slide with a paragraph" }

  context "when there are no lines" do
    let(:markdown) { "# First Slice\n" }

    its(:content) { should eq("") }
  end

  context "with presenter notes" do
    let(:markdown) { "# Header\n\nContent\n\n> Secrets" }

    it "does not include presenter notes in the content" do
      expect(slide.content).to_not include("Secrets")
    end
  end
end
