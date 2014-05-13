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
      Array(lines[2, lines.count - 2]).reject { |line|
        line.start_with?("> ")
      }.join
    end

    def frames
      [render_terminal]
    end

    def lines
      markdown.lines.to_a
    end

    def pdf_content_height(pdf)
      pdf.bounds.height - pdf_header_height
    end

    def pdf_content_top_left(pdf)
      [pdf.bounds.left, pdf.bounds.top - pdf_header_height]
    end

    def pdf_header_height
      header != "" ? 1.in : 0
    end

    def height
      lines.count
    end

    def hard_width?
      true
    end
  end
end
