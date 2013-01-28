class TP::Slide::Paragraph < TP::Slide
  def render
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
