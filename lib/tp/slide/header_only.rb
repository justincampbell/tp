class TP::Slide::HeaderOnly < TP::Slide
  def render_terminal
    centered_header
  end

  def width
    header.length
  end
end
