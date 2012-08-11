require 'spec_helper'

describe TP::Slide do
  subject(:slide) { klass.new markdown }

  let(:markdown) {
    "# First Slide\n\n* Bullet 1\n* Bullet 2"
  }

  its(:markdown) { should == markdown }
  its(:header) { should == "First Slide" }
end
