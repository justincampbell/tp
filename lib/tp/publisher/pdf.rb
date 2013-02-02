require "prawn"
require "prawn/measurement_extensions"

module TP
  module Publisher
    class PDF
      extend Forwardable
      def_delegators :pdf,
        :bounds,
        :canvas,
        :fill_color,
        :fill_rectangle,
        :font,
        :font_size,
        :render_file,
        :start_new_page,
        :text_box,
        :width_of

      attr_reader :input_filename

      def initialize(input_filename, output_filename)
        @input_filename = input_filename
        @output_filename = output_filename
      end

      def publish
        slides.each do |slide|
          render_slide(slide)
        end

        render_file output_filename
      end

      def render_slide(slide)
        new_page

        slide.render_pdf(pdf)
      end

      def markdown
        @markdown ||= File.read(input_filename)
      end

      def presenter
        @presenter ||= Presenter.new(markdown)
      end

      def slides
        presenter.slides
      end

      def output_filename
        @output_filename || "#{input_filename.split('.').first}.pdf"
      end

      def pdf
        @pdf ||= Prawn::Document.new(document_options)
      end

      def document_options
        {
          page_layout: :landscape,
          optimize_objects: true,
          skip_page_creation: true
        }
      end

      def new_page
        start_new_page

        fill_color '111111'

        canvas do
          fill_rectangle [bounds.left, bounds.top], bounds.width, bounds.height
        end

        fill_color 'EEEEEE'

        font "Helvetica"
        font_size 1.in
      end
    end
  end
end
