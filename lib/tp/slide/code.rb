class TP::Slide::Code < TP::Slide
  def render
    header.center(Screen.width) +
      "\n\n" +
      highlighted_code
  end

  def height
    code.lines.count + 2
  end

  def width
    lines.collect { |line| line.rstrip.length }.max
  end

  def code
    content.lines.to_a.reject { |line| line.start_with? "```" }.join
  end

  def highlighted_code
    CodeRay.encode(code, language, :terminal)
  end

  def raw_language
    lines[2].match(/^\`{3}(\w+)/)[1]
  end

  def language
    case raw_language
    when "clj" then "clojure"
    when "objc" then "cpp"
    when "rb" then "ruby"
    else
      raw_language
    end
  end
end
