module Screen
  extend self

  def clear!
    print "\e[2J\e[f"
  end

  def height
    `tput lines`.to_i
  end

  def width
    `tput cols`.to_i
  end
end
