module TP
  class Presenter
    attr_accessor :markdown

    def initialize(markdown)
      self.markdown = markdown
    end

    def present
      slides.each do |slide|
        clear_screen
        show_slide slide
        wait_for_enter
      end
    end

    def slides
      result = markdown.split /^# /
      result.keep_if { |string| string != "" }
      result.map! { |string| "# " + string }

      result.map { |string| Slide.new string }
    end

    def clear_screen
      print "\e[2J\e[f"
    end

    def show_slide(slide)
      puts slide.markdown
    end

    def wait_for_enter
      $stdin.gets
    end
  end
end

