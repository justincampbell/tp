require 'spec_helper'

require 'fileutils'
require 'tmpdir'

describe TP::CLI do
  subject { cli }
  let(:cli) { klass.new }

  let(:tmpdir) { Dir.mktmpdir }
  let(:input_filename) { File.join(tmpdir, "slides.md") }
  let(:slides) { File.read("slides.md") }

  before do
    File.open(input_filename, 'w') {|file| file.write slides }
  end

  after do
    FileUtils.rm_rf tmpdir
  end

  describe "#usage" do
    subject(:usage) { cli.usage }

    it "displays a banner and help" do
      cli.should_receive(:puts).exactly(2).times
      cli.should_receive(:help)

      usage
    end
  end

  describe "#present" do
    subject(:present) { cli.present(input_filename) }

    before do
      Keyboard.stub(:read).and_return(:return, :return, :backspace, 'q')
      Screen.stub(:print)
    end

    it "presents" do
      present
    end
  end

  describe "#pdf" do
    subject(:pdf) { cli.pdf(input_filename, output_filename) }

    let(:output_filename) { File.join(tmpdir, "slides.pdf") }

    it "renders a PDF" do
      pdf

      File.exist?(output_filename).should be_true
    end
  end
end
