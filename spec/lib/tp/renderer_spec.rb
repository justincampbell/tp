require 'spec_helper'

describe TP::Renderer do
  let(:renderer) { described_class.new(text) }
  let(:text) { "foo" }

  before do
    renderer.stub :print
    renderer.stub testing?: false
  end

  describe "#render" do
    subject(:render) { renderer.render }

    it "clears the screen" do
      expect(Screen).to receive(:clear!)

      render
    end

    it "prints the text to the screen" do
      expect(Screen).to receive(:print).with(text)

      render
    end
  end
end
