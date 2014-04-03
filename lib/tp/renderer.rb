module TP
  class Renderer
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def render
      Screen.clear!

      return unless text

      Screen.print Screen.add_gutter(text)

      Screen.hide_cursor

      true
    end
  end
end
