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
        puts slide.body
      end
    end

    def wait_for_enter
      $stdin.gets
    end
  end
end

