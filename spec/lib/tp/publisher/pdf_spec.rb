require 'spec_helper'

describe TP::Publisher::PDF do
  subject { publisher }
  let(:publisher) { klass.new(input_filename, output_filename) }

  let(:input_filename) { "slides.md" }
  let(:output_filename) { nil }

  its(:output_filename) { should == "slides.pdf" }
end
