require "tp/version"

module TP
  class Presenter
    def self.present(markdown)
      slides = markdown.split(/^# /).keep_if { |string| string != "" }.map { |string| "# " + string }

      slides.each do |slide|
        print "\e[2J\e[f"
        puts slide
        $stdin.gets
      end
    end
  end
end
