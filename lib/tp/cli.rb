module TP
  class CLI < Thor
    default_task :usage

    desc "usage", "Display usage banner", hide: true
    def usage
      puts [
        "Terminal Presenter #{TP::VERSION}",
        "https://github.com/justincampbell/tp"
      ].join("\n")

      puts "\n"

      help
    end

    method_option :gutter, default: true
    desc "FILENAME", "Present a Markdown file in your terminal"
    def present(filename)
      TP.configuration.merge! options
      TP::Presenter.new(File.read(filename)).present
    end

    desc "pdf FILENAME [OUTPUT]", "Convert a Markdown slide deck to a PDF"
    def pdf(filename, output = nil)
      TP::Publisher::PDF.new(filename, output).publish
    end
  end
end
