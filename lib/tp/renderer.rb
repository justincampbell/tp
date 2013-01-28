module TP
  class Renderer
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def render
      Screen.clear!

      return unless text

      print text unless testing?

      true
    end

    def testing?
      ENV['RUBY_ENV'] == 'test'
    end
  end
end
