class TP::Slide::Bulleted < TP::Slide
  BULLET = "\u2022 "

  def render
    frames.last
  end

  def width
    header_length = header.length
    longest_bullet = bullets.collect(&:length).max + 2
    [header_length, longest_bullet].max
  end

  def bullets
    content.lines.to_a.map { |line| line.gsub(/^\*\s/, "").strip }
  end

  def frames
    return @frames if @frames

    buffer = centered_header
    buffer << "\n\n"

    @frames = [buffer.dup]

    bullets.each do |bullet|
      buffer << "#{BULLET} #{bullet}\n"
      @frames << buffer.dup
    end

    @frames
  end
end
