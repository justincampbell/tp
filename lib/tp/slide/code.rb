class TP::Slide::Code < TP::Slide
  def render_pdf(pdf)
    header_height = header != "" ? 1.in : 0

    pdf.text_box header,
      align: :center,
      overflow: :shrink_to_fit,
      single_line: true,
      height: header_height,
      size: 1.in

    pdf.font 'Courier' do
      maximum_length = [code.lines.to_a.map(&:length).max, 80].min
      character_ratio = pdf.font_size / pdf.width_of("#")

      prawn_code = code.gsub(' ', Prawn::Text::NBSP)
      prawn_code = CodeRay.scan(prawn_code, language).to_prawn

      pdf.formatted_text_box prawn_code,
        at: [pdf.bounds.left, pdf.bounds.top - header_height],
        height: pdf.bounds.height - header_height,
        size: (pdf.bounds.width / maximum_length) * character_ratio,
        valign: :center
    end
  end

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
