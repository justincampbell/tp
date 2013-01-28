require 'spec_helper'

describe TP::Slide do
  subject(:slide) { klass.new markdown }

  let(:markdown) {
    "# First Slide\n\n* Bullet 1\n* Bullet 2"
  }

  its(:markdown) { should == markdown }

  context "with bullets" do
    let(:markdown) {
      "# First Slide\n\n* Bullet 1\n* Bullet 2"
    }

    its(:header) { should == "First Slide" }
    its(:body) { should == "* Bullet 1\n* Bullet 2" }

    its(:bullets) { should =~ ["Bullet 1", "Bullet 2"] }
    its(:paragraph) { should be_nil }

    its(:width) { should == 11 }
    its(:height) { should == 4 }
  end

  context "with a paragraph" do
    let(:markdown) {
      "# First Slide\n\nThis is a paragraph of text"
    }

    its(:header) { should == "First Slide" }
    its(:body) { should == "This is a paragraph of text" }

    its(:bullets) { should be_nil }
    its(:paragraph) { should == "This is a paragraph of text" }

    its(:width) { should == 27 }
    its(:height) { should == 3 }
  end

  context "with just a header" do
    let(:markdown) {
      "# First Slide"
    }

    its(:header) { should == "First Slide" }
    its(:body) { should be_nil }

    its(:bullets) { should be_nil }
    its(:paragraph) { should be_nil }

    its(:width) { should == 11 }
    its(:height) { should == 1 }
  end

  context "with a header longer than the paragraph" do
    let(:markdown) {
      "# This is a very long header\n\nand short paragraph"
    }

    its(:width) { should == 26 }
  end

  context "with a blank header" do
    let(:markdown) {
      "#\n\nFirst Slide"
    }

    its(:header) { should be_empty }
    its(:body) { should == "First Slide" }

    its(:bullets) { should be_nil }
    its(:paragraph) { should == "First Slide" }

    its(:width) { should == 11 }
    its(:height) { should == 3 }
  end

  context "with trailing newlines" do
    let(:markdown) {
      "# First Slide\n\n* Bullet 1\n* Bullet 2\n\n"
    }

    it "strips whitespace" do
      slide.markdown.should == "# First Slide\n\n* Bullet 1\n* Bullet 2"
    end
  end
end
