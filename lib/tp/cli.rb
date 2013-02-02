module TP
  class CLI
    attr_reader :arguments

    def initialize(arguments)
      @arguments = arguments
    end

    def help
puts <<-HELP
Terminal Presenter #{TP::VERSION}
https://github.com/justincampbell/tp

  tp FILENAME # Present a Markdown file in your terminal
  tp help     # Display this help
HELP
    end

    def run
      return help unless arguments.any?
      return help if arguments.first == "help"

      TP::Presenter.new(File.read(filename)).present
    end

    private

    def filename
      arguments[0]
    end
  end
end
