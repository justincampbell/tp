class TP::Slide::HeaderOnly < TP::Slide
  def render
    header.center Screen.width
  end

  def width
    header.length
  end
end
