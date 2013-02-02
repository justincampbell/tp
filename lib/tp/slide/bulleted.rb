class TP::Slide::Bulleted < TP::Slide
  BULLET = "\u2022 "

  def render_pdf(pdf)
    header_height = header != "" ? 1.in : 0

    pdf.text_box header,
      align: :center,
      overflow: :shrink_to_fit,
      single_line: true,
      height: header_height,
      size: 1.in

    pdf.text_box bullets.map { |text| "#{BULLET} #{text}" }.join("\n"),
      at: [pdf.bounds.left, pdf.bounds.top - header_height],
      height: pdf.bounds.height - header_height,
      overflow: :shrink_to_fit,
      valign: :center
  end

  def render_terminal
    frames.last
  end

  def width
    header_length = header.length
    longest_bullet = bullets.collect(&:length).max + 2
    [header_length, longest_bullet].max
  end

  def bullets
    content.lines.to_a.map { |line| line.gsub(/^[\*|-]\s/, "").strip }
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
