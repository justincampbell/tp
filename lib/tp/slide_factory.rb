module TP
  class SlideFactory
    def self.from_markdown(markdown)
      lines = markdown.lines.to_a

      return Slide::HeaderOnly.new markdown if lines.count < 3

      content = lines[2, lines.count - 2].join

      case content.lines.first
      when /^\*\s/
        Slide::Bulleted.new markdown
      when /^\`{3}/
        Slide::Code.new markdown
      else
        Slide::Paragraph.new markdown
      end
    end
  end
end
