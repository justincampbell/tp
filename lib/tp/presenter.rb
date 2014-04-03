module TP
  class Presenter
    attr_reader :markdown

    def initialize(markdown)
      @markdown = markdown
    end

    def present
      suggest_sizing
      render_slides
      clear_screen
    end

    def suggest_sizing
      Screen.suggest slide_deck.width, slide_deck.height
      Keyboard.wait_for_return
    end

    def render_slides
      loop do
        Renderer.new(slide_deck.current_frame).render

        case Keyboard.read
        when :right, :down, :space, :return, 'l', 'j', 'd', 's'
          slide_deck.next
        when :left, :up, :backspace, 'h', 'k', 'a', 'w'
          slide_deck.previous
        when 'q'
          break
        end

        break if slide_deck.ended?
      end
    end

    def clear_screen
      Screen.clear!
    end

    def slides
      result = markdown.split /^#/
      result.reject! &:empty?
      result.map! { |string| "##{string}" }

      result.map { |string| SlideFactory.from_markdown string }
    end

    def slide_deck
      @slide_deck ||= SlideDeck.new slides
    end
  end
end

