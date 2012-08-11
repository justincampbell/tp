module TP
  class Presenter
    attr_accessor :markdown

    def initialize(markdown)
      self.markdown = markdown
    end

    def present
      Screen.suggest 30, 8
      Keyboard.wait_for_return

      slides.each do |slide|
        Screen.clear!
        show_slide slide
        Keyboard.wait_for_return
      end

      Screen.clear!
    end

    def slides
      result = markdown.split /^# /
      result.reject! &:empty?
      result.map! { |string| string.prepend "#" }

      result.map { |string| Slide.new string }
    end

    def show_slide(slide)
      buffer = slide.header.center Screen.width

      if slide.body
        buffer << "\n\n"

        if slide.paragraph
          buffer << slide.paragraph.center(Screen.width)
        else
          slide.bullets.each { |string| buffer << "#{bullet}#{string}\n" }
        end
      end

      print buffer
    end

    def bullet
      "\u2022 "
    end
  end
end

