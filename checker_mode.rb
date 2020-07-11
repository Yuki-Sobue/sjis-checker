module CheckerMode
  class Base


    def execute(string)
      raise "please override execute method in subclass of CheckerMode::Base"
    end
  end

  class Default < Base

    def execute(string)
      string
    end
  end

  class Replace < Base
    attr_accessor :replacer

    def initalize(char = " ")
       self.replacer = char.to_s
    end

    def execute(string)
      string
    end
  end
end