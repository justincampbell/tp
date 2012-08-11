require 'keyboard'

require 'spec_helper'

describe Keyboard do
  describe ".wait_for_enter" do
    subject(:wait_for_enter) { klass.wait_for_enter }

    it "waits for enter" do
      $stdin.should_receive :gets

      wait_for_enter
    end
  end
end
