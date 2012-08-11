module Keyboard
  extend self

  def read
    begin
      old_stty = `stty -g`
      system "stty raw -echo"

      chr = STDIN.getc.chr

      if chr == "\e"
        extra_thread = Thread.new {
          chr = chr + STDIN.getc.chr
          chr = chr + STDIN.getc.chr
        }

        extra_thread.join 0.00001
        extra_thread.kill
      end
    ensure
      system "stty #{old_stty}"
    end

    symbolize chr
  end

  def wait_for_return
    loop do
      result = read

      return result if result == :return
    end
  end

  private

  def symbolize(character)
    case character
    when " "
      :space
    when "\t"
      :tab
    when "\r", "\n"
      :return
    when "\e"
      :escape
    when "\e[A"
      :up
    when "\e[B"
      :down
    when "\e[D"
      :left
    when "\e[C"
      :right
    when "\177"
      :backspace
    when "\004"
      :delete
    else
      character
    end
  end
end
