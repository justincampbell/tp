module TP
  class Slide
    attr_accessor :markdown

    def initialize(markdown)
      self.markdown = markdown.strip
    end

    def header
      match = markdown.match /^#\s*(.+)(?:\n)*/

      match[1] if match
    end

    def body
      match = markdown.match /^#\s*.+\n\n(.*)/m

      match[1] if match
    end
  end
end
