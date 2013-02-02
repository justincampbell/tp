module TP
  class CLI
    attr_reader :arguments

    def initialize(arguments)
      @arguments = arguments
    end

    def run
      TP::Presenter.new(File.read(arguments[0])).present
    end
  end
end
