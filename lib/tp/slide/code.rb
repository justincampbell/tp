class TP::Slide::Code < TP::Slide
  def render_terminal
    centered_header +
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
    match = lines[2].match(/^\`{3}(\w+)/)

    match[1] if match
  end

  def language
    case raw_language
    when nil then "text"
    when "clj" then "clojure"
    when "objc" then "cpp"
    when "rb" then "ruby"
    else
      raw_language
    end
  end
end
