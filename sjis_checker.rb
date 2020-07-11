require "./checker_mode.rb"
class SjisChecker
  attr_accessor :mode

  def initialize(mode = CheckerMode::Default)
    @mode = mode
  end

  def scan(string)
    mode.execute(string)
  end
end