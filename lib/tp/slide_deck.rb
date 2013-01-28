module TP
  class SlideDeck
    attr_reader :cursor, :slides

    def initialize(slides)
      @cursor = 0
      @slides = slides
    end

    def [](index)
      frames[index]
    end

    def current
      frames[cursor]
    end
    alias current_frame current

    def ended?
      not current
    end

    def frames
      return @frames if @frames

      @frames = []

      slides.each do |slide|
        @frames |= slide.frames
      end

      @frames
    end

    def next
      @cursor += 1

      current
    end

    def previous
      @cursor -= 1

      current
    end

    def width
      slides_without_paragraphs = slides.reject { |slide| slide.class == TP::Slide::Paragraph }

      if slides_without_paragraphs.empty?
        [slides.collect(&:width).max, 80].min
      else
        [
          slides.collect(&:header).map(&:length).max,
          slides_without_paragraphs.collect(&:width).max
        ].max
      end
    end

    def height
      slides.collect(&:height).max
    end
  end
end
