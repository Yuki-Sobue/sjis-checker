module CheckerMode
  class Base
    def execute(string)
      raise "please override execute method in subclass of CheckerMode::Base"
    end

    def encode(string)
      begin
        str.to_s.encode(encoding)
      rescue
        raise "Cannot use this string in #{encoding}"
      end
    end
  
    def available?(string)
      begin
        string.encode(encoding)
      true
      rescue
        false
      end
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

    def set_replacer(string)
      self.replacer = string
    end
  end
end