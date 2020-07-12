require "./checker_mode.rb"

class SjisChecker
  attr_accessor :mode, :encoding

  def initialize(mode = CheckerMode::Default)
    self.encoding = "SJIS"
    self.mode = mode.new
  end

  def normal_mode 
    self.mode = CheckerMode::Default.new
    self
  end

  def replace_mode
    self.mode = CheckerMode::Replace.new
    self
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