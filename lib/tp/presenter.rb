module TP
  class Presenter
    attr_reader :markdown

    def initialize(markdown)
      @markdown = markdown
    end

    def present
      Screen.suggest slide_deck.width, slide_deck.height
      Keyboard.wait_for_return

      loop do
        Renderer::Terminal.new(slide_deck.current_frame).render

        case Keyboard.read
        when :right, :down, :space, :return, 'l', 'k', 'd', 's'
          slide_deck.next
        when :left, :up, :backspace, 'h', 'j', 'a', 'w'
          slide_deck.previous
        when 'q'
          break
        end

        break if slide_deck.ended?
      end

      Screen.clear!
    end

    def slides
      result = markdown.split /^#/
      result.reject! &:empty?
      result.map! { |string| string.prepend "#" }

      result.map { |string| SlideFactory.from_markdown string }
    end

    def slide_deck
      @slide_deck ||= SlideDeck.new slides
    end
  end
end

