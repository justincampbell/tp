module TP
  class SlideDeck
    attr_accessor :cursor, :slides

    def initialize(slides)
      self.cursor = 0
      self.slides = slides
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
        if slide.bullets
          buffer = "# #{slide.header}"

          @frames << Slide.new(buffer)

          buffer << "\n"

          slide.bullets.each do |bullet|
            buffer << "\n* #{bullet}"
            @frames << Slide.new(buffer)
          end
        else
          @frames << Slide.new("# #{slide.header}\n\n#{slide.body}")
        end
      end

      @frames
    end

    def next
      self.cursor += 1

      current
    end

    def previous
      self.cursor -= 1

      current
    end

    def width
      [slides.collect(&:width).max, 80].min
    end

    def height
      slides.collect(&:height).max
    end
  end
end
