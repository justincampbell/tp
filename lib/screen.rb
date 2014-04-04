module Screen
  extend self

  X_GUTTER = 2
  Y_GUTTER = 1
  GUTTER_CHAR = "\u2591"
  SUGGEST_CHAR = "\u2588"

  def add_gutter(text)
    text = text.lines.map { |line|
      line == "\n" ? line : " " * X_GUTTER + line
    }.join
    text = "\n" * Y_GUTTER + text
    text
  end

  def clear!
    print "\e[2J\e[f"
  end

  def hide_cursor
    print "\e[#{height};#{width + X_GUTTER * 2}H"
  end

  def height
    `tput lines`.to_i
  end

  def print(text)
    Kernel.print text
  end

  def suggest(x, y)
    Y_GUTTER.times { print GUTTER_CHAR * (x + X_GUTTER * 2) + "\n" }
    y.times do |n|
      print "\n" if n.nonzero?
      print GUTTER_CHAR * X_GUTTER + SUGGEST_CHAR * x + GUTTER_CHAR * X_GUTTER
    end
    Y_GUTTER.times { print "\n" + GUTTER_CHAR * (x + X_GUTTER * 2) }
  end

  def width
    `tput cols`.to_i - X_GUTTER * 2
  end
end
