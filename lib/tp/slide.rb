module TP
  class Slide
    attr_accessor :markdown

    def initialize(markdown)
      self.markdown = markdown
    end

    def header
      markdown.match(/^#\s(.+)\n\n/)[1]
    end
  end
end
