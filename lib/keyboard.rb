module Keyboard
  extend self

  def read
    chr = ""

    with_stty "raw -echo" do
      chr << STDIN.getc.chr

      chr = extra_thread_trick(chr) if chr == "\e"
    end

    symbolize(chr)
  end

  def wait_for_return
    loop do
      result = read

      return result if result == :return
    end
  end

  private

  def extra_thread_trick(chr)
    extra_thread = Thread.new {
      chr = chr + STDIN.getc.chr
      chr = chr + STDIN.getc.chr
    }

    extra_thread.join 0.00001
    extra_thread.kill

    chr
  end

  def with_stty(options, &block)
    begin
      old_stty = `stty -g`
      system "stty #{options}"

      yield
    ensure
      system "stty #{old_stty}"
    end
  end

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
