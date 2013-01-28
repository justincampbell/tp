module TP
  class Slide
    attr_reader :markdown

    def initialize(markdown)
      @markdown = markdown.strip
    end

    def header
      line = lines.first
      line[1, line.length - 1].to_s.strip
    end

    def centered_header
      header.center Screen.width
    end

    def content
      result = lines[2, lines.count - 2]

      result.join("") if result
    end

    def frames
      [render]
    end

    def lines
      markdown.lines.to_a
    end

    def render
      raise NotImplementedError
    end

    def width
      raise NotImplementedError
    end

    def height
      lines.count
    end
  end
end
