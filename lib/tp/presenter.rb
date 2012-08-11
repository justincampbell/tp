module TP
  class Presenter
    attr_accessor :markdown

    def initialize(markdown)
      self.markdown = markdown
    end

    def present
      slides.each do |slide|
        Screen.clear!
        show_slide slide
        Keyboard.wait_for_enter
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
      puts slide.header.center Screen.width

      if slide.body
        puts "\n"

        if slide.paragraph
          puts slide.body.center Screen.width
        else
          puts slide.bullets.map { |string| string.prepend bullet }
        end
      end
    end

    def bullet
      "\u2022 "
    end
  end
end

