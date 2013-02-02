require 'spec_helper'

describe TP::CLI do
  subject { cli }
  let(:cli) { klass.new(arguments) }

  let(:arguments) { [] }
  let(:filename) { "slides.md" }
  let(:presenter_stub) { stub(TP::Presenter) }
  let(:slides) { "# First Slide" }

  describe "#run" do
    subject { run }

    let(:run) { cli.run }

    it "shows help" do
      cli.should_receive(:help)

      run
    end

    context "with 'help'" do
      let(:arguments) { ["help"] }

      it "shows help" do
        cli.should_receive(:help)

        run
      end
    end

    context "with a filename" do
      let(:arguments) { [filename] }

      before do
        File.stub read: slides
      end

      it "invokes a presenter" do
        TP::Presenter.should_receive(:new).with(slides).and_return(presenter_stub)
        presenter_stub.should_receive(:present)

        run
      end
    end
  end
end
