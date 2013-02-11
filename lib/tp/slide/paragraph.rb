class TP::Slide::Paragraph < TP::Slide
  def render_pdf(pdf)
    pdf.text_box header,
      align: :center,
      overflow: :shrink_to_fit,
      single_line: true,
      height: pdf_header_height,
      size: pdf_header_height

    pdf.text_box paragraph,
      at: pdf_content_top_left(pdf),
      height: pdf_content_height(pdf),
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
