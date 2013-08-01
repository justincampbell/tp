class TP::Slide::Code < TP::Slide
  LANGUAGE_MAPPINGS = {
    [nil] => 'text',
    %w[clj] => 'clojure',
    %w[ex exs elixir] => 'ruby',
    %w[objc] => 'cpp',
    %w[rb] => 'ruby'
  }

  def render_pdf(pdf)
    pdf.text_box header,
      align: :center,
      overflow: :shrink_to_fit,
      single_line: true,
      height: pdf_header_height,
      size: pdf_header_height

    pdf.font 'Courier' do
      pdf.formatted_text_box prawn_code,
        at: pdf_content_top_left(pdf),
        height: pdf_content_height(pdf),
        size: (pdf.bounds.width / maximum_line_length) * character_ratio(pdf),
        valign: :center
    end
  end

  def character_ratio(pdf)
    pdf.font_size / pdf.width_of("#")
  end

  def maximum_line_length
    [code.lines.to_a.map { |line| line.rstrip.length }.max, 80].min
  end

  def prawn_code
    CodeRay.scan(code.gsub(' ', Prawn::Text::NBSP), language).to_prawn
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
    LANGUAGE_MAPPINGS.each do |keys, value|
      return value if keys.include? raw_language
    end

    raw_language
  end
end
