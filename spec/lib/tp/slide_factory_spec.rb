require 'spec_helper'

describe TP::SlideFactory do
  describe ".from_markdown" do
    subject(:from_markdown) { klass.from_markdown markdown }

    context "with only a header" do
      let(:markdown) { "# Header" }

      it { should be_a TP::Slide::HeaderOnly }
    end

    context "with a paragraph" do
      let(:markdown) { "# Paragraph\n\nThis is a paragraph" }

      it { should be_a TP::Slide::Paragraph }
    end

    context "with bullets" do
      let(:markdown) { "# Bullets\n\n* Bullet" }

      it { should be_a TP::Slide::Bulleted }
    end

    context "with a code block" do
      let(:markdown) { "# Code\n\n```rb\n:test\n```" }

      it { should be_a TP::Slide::Code }
    end
  end
end
