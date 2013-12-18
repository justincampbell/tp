class String
  def wrap(width)
    width = [width, 1].max

    split("\n").collect { |line|
      if line.length > width
        line.gsub(/(.{1,#{width}})(\s+|$)/, "\\1\n").strip
      else
        line
      end
    } * "\n"
  end
end
