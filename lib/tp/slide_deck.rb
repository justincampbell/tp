module TP
  class SlideDeck
    attr_accessor :cursor, :slides

    def initialize(slides)
      self.cursor = 0
      self.slides = slides
    end

    def [](index)
      slides[index]
    end

    def current
      slides[cursor]
    end

    def next
      self.cursor += 1

      current
    end

    def previous
      self.cursor -= 1

      current
    end
  end
end
