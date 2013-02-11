class TP::Slide::Bulleted < TP::Slide
  BULLET = "\u2022"

  def render_pdf(pdf)
    pdf.text_box header,
      align: :center,
      overflow: :shrink_to_fit,
      single_line: true,
      height: pdf_header_height,
      size: pdf_header_height

    pdf.text_box rendered_bullets,
      at: pdf_content_top_left(pdf),
      height: pdf_content_height(pdf),
      overflow: :shrink_to_fit,
      valign: :center
  end

  def render_terminal
    frames.last
  end

  def width
    header_length = header.length
    longest_bullet = bullets.collect(&:length).max + bullet_length
    [header_length, longest_bullet].max
  end

  def bullets
    content.lines.to_a.map { |line| line.gsub(/^[\*|-]\s/, "").strip }
  end

  def bullet_length
    BULLET.length + 1
  end

  def rendered_bullets
    bullets.map { |text| "#{BULLET} #{text}" }.join("\n")
  end

  def frames
    return @frames if @frames

    buffer = centered_header
    buffer << "\n\n"

    @frames = [buffer.dup]

    bullets.each do |line|
      buffer << "#{BULLET} #{line}\n"
      @frames << buffer.dup
    end

    @frames
  end
end
