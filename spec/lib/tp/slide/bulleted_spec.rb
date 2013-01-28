require 'spec_helper'

describe TP::Slide::Bulleted do
  subject { slide }

  let(:markdown) { "# Bullets\n\n* Bullet 1\n* Bullet 2" }
  let(:slide) { klass.new markdown }

  before do
    Screen.stub width: 20
  end

  its(:width) { should == 10 }
  its(:height) { should == 4 }

  describe "#render" do
    subject(:lines) { slide.render.lines.to_a }

    it { lines.count.should == 4 }

    it "centers the header" do
      lines[0].should == "Bullets".center(20) + "\n"
    end

    it "renders bullets" do
      lines[2].should == "#{TP::Slide::Bulleted::BULLET} Bullet 1\n"
      lines[3].should == "#{TP::Slide::Bulleted::BULLET} Bullet 2\n"
    end
  end

  describe "#frames" do
    subject(:frames) { slide.frames }

    its(:count) { should == 3 }

    it "incrementally shows bullets" do
      frames[0].should == "Bullets".center(20) + "\n\n"

      frames[1].should == "Bullets".center(20) + "\n\n" +
        "#{TP::Slide::Bulleted::BULLET} Bullet 1\n"

      frames[2].should == "Bullets".center(20) + "\n\n" +
        "#{TP::Slide::Bulleted::BULLET} Bullet 1\n" +
        "#{TP::Slide::Bulleted::BULLET} Bullet 2\n"
    end
  end
end
