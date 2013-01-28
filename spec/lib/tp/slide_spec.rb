require 'spec_helper'

describe TP::Slide do
  subject(:slide) { klass.new markdown }

  let(:markdown) {
    "# First Slide\n\nThis is a slide with a paragraph"
  }

  its(:markdown) { should == markdown }

  its(:header) { should == "First Slide" }
  its(:content) { should == "This is a slide with a paragraph" }
end
