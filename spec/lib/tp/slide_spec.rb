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
  end

  context "with a paragraph" do
    let(:markdown) {
      "# First Slide\n\nThis is a paragraph of text"
    }

    its(:header) { should == "First Slide" }
    its(:body) { should == "This is a paragraph of text" }

    its(:bullets) { should be_nil }
    its(:paragraph) { should == "This is a paragraph of text" }
  end

  context "with just a header" do
    let(:markdown) {
      "# First Slide"
    }

    its(:header) { should == "First Slide" }
    its(:body) { should be_nil }

    its(:bullets) { should be_nil }
    its(:paragraph) { should be_nil }
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
