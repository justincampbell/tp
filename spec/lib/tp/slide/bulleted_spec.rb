require 'spec_helper'

describe TP::Slide::Bulleted do
  subject { slide }

  let(:bullet) { TP::Slide::Bulleted::BULLET }
  let(:markdown) { "# Bullets\n\n* Bullet 1\n* Bullet 2" }
  let(:slide) { klass.new markdown }

  before do
    Screen.stub width: 20
  end

  its(:bullets) { should == ["Bullet 1", "Bullet 2"] }

  its(:width) { should == 10 }
  its(:height) { should == 4 }

  context "with dash bullets" do
    let(:markdown) { "# Bullets\n\n- Bullet 1\n- Bullet 2" }

    its(:bullets) { should == ["Bullet 1", "Bullet 2"] }
  end

  describe "#render_terminal" do
    subject(:lines) { slide.render_terminal.lines.to_a }

    it { lines.count.should == 4 }

    it "centers the header" do
      lines[0].should == "Bullets".center(20) + "\n"
    end

    it "renders bullets" do
      lines[2].should == "#{bullet} Bullet 1\n"
      lines[3].should == "#{bullet} Bullet 2\n"
    end
  end

  describe "#rendered_bullets" do
    subject(:rendered_bullets) { slide.rendered_bullets }

    it { should == "#{bullet} Bullet 1\n#{bullet} Bullet 2" }
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
