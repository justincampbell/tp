module TP
  class Renderer
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def render
      Screen.clear!

      return unless text

      if TP.configuration[:gutter]
        Screen.print Screen.add_gutter(text)
      else
        Screen.print text
      end

      Screen.hide_cursor

      true
    end
  end
end
