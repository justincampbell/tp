require "coderay"

class PrawnEncoder < CodeRay::Encoders::Encoder
  register_for :to_prawn

  COLORS = {
    default: "E6E1DC",
    comment: "BC9458",
    constant: "DA4939",
    instance_variable: "D0D0FF",
    integer: "56D65E",
    float: "56D65E",
    inline_delimiter: "EF804F",
    keyword: "CC7833",
    method: "FFC66D",
    string: "A5C261",
    symbol: "6D9CBE"
  }

  def setup(options)
    super
    @out  = []
    @open = []
  end

  def text_token(text, kind)
    color = COLORS[kind] || COLORS[@open.last] || COLORS[:default]

    @out << {:text => text, :color => color}
  end

  def begin_group(kind)
    @open << kind
  end

  def end_group(kind)
    @open.pop
  end
end
