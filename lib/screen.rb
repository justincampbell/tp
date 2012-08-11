module Screen
  extend self

  def clear!
    print "\e[2J\e[f"
  end

  def height
    `tput lines`.to_i
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
