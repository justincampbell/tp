module Screen
  extend self

  def clear!
    print "\e[2J\e[f"
  end

  def hide_cursor
    print "\e[#{height};#{width}H"
  end

  def height
    `tput lines`.to_i
  end

  def print(text)
    Kernel.print text
  end

  def suggest(x, y)
    y.times do |n|
      print "\n" if n.nonzero?
      print "\u2588" * x
    end
  end

  def width
    `tput cols`.to_i
  end
end
