require "./checker_mode.rb"


class SjisChecker
  attr_accessor :mode, :encoding

  def initialize(mode = CheckerMode::Default)
    @encoding = "SJIS"
    @mode = mode.new
  end

  def encode(str)
    str.encode(encoding)
  end

  def scan(string)
    mode.execute(string)
  end

  def set_replacer(string)
    mode.set_replacer(string)
  end
end