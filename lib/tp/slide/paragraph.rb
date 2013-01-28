class TP::Slide::Paragraph < TP::Slide
  def render
    paragraph = content.wrap Screen.width
    paragraph = paragraph.center Screen.width if paragraph.lines.one?

    header.center(Screen.width) + "\n\n" + paragraph
  end

  def width
    content.length
  end
end
