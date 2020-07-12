require "./checker_mode.rb"

class SjisChecker
  attr_accessor :encoding
  attr_writer :mode

  def initialize(mode = CheckerMode::Default)
    self.encoding = "SJIS"
    self.mode = mode.new
  end

  def current_mode
    @mode
  end

  def default_mode
    normal_mode
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
    current_mode.encode(string, encoding)
  end

  def available?(string)
    current_mode.available?(string, encoding)
  end

  def execute(string)
    current_mode.execute(string, encoding)
  end

  def set_replacer(string)
    current_mode.set_replacer(string, encoding)
  end
end