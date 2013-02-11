module TP
  class SlideDeck
    attr_reader :cursor, :slides

    def initialize(slides)
      @cursor = 0
      @slides = slides
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
      if maximum_hard_width
        [maximum_header_length, maximum_hard_width].max
      else
        [maximum_width, 80].min
      end
    end

    def height
      slides.collect(&:height).max
    end

    def maximum_header_length
      slides.collect(&:header).map(&:length).max
    end

    def maximum_width
      slides.collect(&:width).max
    end

    def maximum_hard_width
      slides.select(&:hard_width?).collect(&:width).max
    end
  end
end
