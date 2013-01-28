class TP::Slide::HeaderOnly < TP::Slide
  def render
    centered_header
  end

  def width
    header.length
  end
end
