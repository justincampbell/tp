module TP
  class Slide
    attr_accessor :markdown

    def initialize(markdown)
      self.markdown = markdown.strip
    end

    def header
      line = lines.first
      line[1, line.length - 1].to_s.strip
    end

    def body
      result = lines[2, lines.count - 2]

      result.join "" if result
    end

    def bullets
      return unless body

      result = body.scan(/^\*\s+(.+)/).flatten

      result if result.any?
    end

    def paragraph
      body unless bullets
    end

    def width
      return header.length unless body

      (body.lines.to_a.collect(&:length) + [header.length]).max
    end

    def height
      return 1 unless body

      body.lines.count + 2
    end

    private

    def lines
      markdown.lines.to_a
    end
  end
end
