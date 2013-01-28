require 'spec_helper'

describe TP::SlideDeck do
  subject(:slide_deck) { klass.new slides }

  let(:slides) {
    [
      TP::Slide.new("# First Slide\n\n* Bullet 1\n* Bullet 2"),
      TP::Slide.new("# Second Slide\n\nThis is a paragraph")
    ]
  }

  its(:height) { should == 4 }
  its(:width) { should == 19 }

  context "with really long paragraphs" do
    let (:slides) {
      [TP::Slide.new("# First Slide\n\n#{'word ' * 100}")]
    }

    its(:width) { should == 80 }
  end

  it { slide_deck.frames.count.should == 4 }
end
