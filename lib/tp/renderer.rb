module TP
  class Renderer
    BULLET = "\u2022 "

    attr_accessor :slide

    def initialize(slide)
      self.slide = slide
    end

    def render
      Screen.clear!

      return unless slide

      buffer = slide.header.center Screen.width

      if slide.body
        buffer << "\n\n"

        if slide.paragraph
          paragraph = slide.paragraph.wrap Screen.width
          paragraph = paragraph.center Screen.width if paragraph.lines.one?

          buffer << paragraph
        else
          slide.bullets.each { |string| buffer << "#{BULLET}#{string}\n" }
        end
      end

      print buffer unless ENV['RUBY_ENV'] == 'test'

      true
    end
  end
end
