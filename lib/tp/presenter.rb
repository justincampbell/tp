module TP
  class Presenter
    attr_accessor :markdown

    def initialize(markdown)
      self.markdown = markdown
    end

    def present
      Screen.suggest 30, 8
      Keyboard.wait_for_return

      loop do
        Screen.clear!

        show_slide slide_deck.current or break

        case Keyboard.read
        when :right, :down, :space, :return, 'l', 'k'
          slide_deck.next
        when :left, :up, :backspace, 'h', 'j'
          slide_deck.previous
        when 'q'
          break
        end
      end

      Screen.clear!
    end

    def slides
      result = markdown.split /^# /
      result.reject! &:empty?
      result.map! { |string| string.prepend "#" }

      result.map { |string| Slide.new string }
    end

    def slide_deck
      @slide_deck ||= SlideDeck.new slides
    end

    def show_slide(slide)
      return unless slide

      buffer = slide.header.center Screen.width

      if slide.body
        buffer << "\n\n"

        if slide.paragraph
          paragraph = slide.paragraph.wrap Screen.width
          paragraph = paragraph.center Screen.width if paragraph.lines.one?

          buffer << paragraph
        else
          slide.bullets.each { |string| buffer << "#{bullet}#{string}\n" }
        end
      end

      print buffer

      true
    end

    def bullet
      "\u2022 "
    end
  end
end

