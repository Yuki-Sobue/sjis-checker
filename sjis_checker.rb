require "./checker_mode.rb"

class SjisChecker
  attr_accessor :mode, :encoding

  def initialize(mode = CheckerMode::Default)
    @encoding = "SJIS"
    @mode = mode.new
  end

  def encode(string)
    mode.encode(string, encoding)
  end

  def available?(string)
    mode.available?(string, encoding)
  end

  def execute(string)
    mode.execute(string, encoding)
  end

  def set_replacer(string)
    mode.set_replacer(string)
  end
end