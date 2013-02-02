class TP::Slide::Paragraph < TP::Slide
  def render_pdf(pdf)
    header_height = header != "" ? 1.in : 0

    pdf.text_box header,
      align: :center,
      overflow: :shrink_to_fit,
      single_line: true,
      height: header_height,
      size: 1.in

    pdf.text_box paragraph,
      at: [pdf.bounds.left, pdf.bounds.top - header_height],
      height: pdf.bounds.height - header_height,
      overflow: :shrink_to_fit,
      valign: :center
  end

  def render_terminal
    centered_header +
      "\n\n" +
      paragraph
  end

  def paragraph
    buffer = content.wrap Screen.width
    buffer = buffer.center Screen.width if buffer.lines.one?

    buffer
  end

  def width
    content.length
  end

  def hard_width?
    false
  end
end
