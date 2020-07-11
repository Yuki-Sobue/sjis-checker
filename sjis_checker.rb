require "./checker_mode.rb"


class SjisChecker
  attr_accessor :mode, :encoding

  def initialize(mode = CheckerMode::Default)
    @encoding = "SJIS"
    @mode = mode.new
  end

  def encode(string)
    mode.encode(string)
  end

  def available?(string)
    mode.available?(string)
  end

  def execute(string)
    mode.execute(string)
  end

  def set_replacer(string)
    mode.set_replacer(string)
  end
end