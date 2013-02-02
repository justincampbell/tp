class TP::Slide::HeaderOnly < TP::Slide
  def render_pdf(pdf)
    pdf.text_box header,
      align: :center,
      overflow: :shrink_to_fit,
      single_line: true,
      size: pdf.bounds.height,
      valign: :center
  end

  def render_terminal
    centered_header
  end

  def width
    header.length
  end
end
