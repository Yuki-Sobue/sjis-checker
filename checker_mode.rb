module CheckerMode
  class Base
    def execute(string)
      raise "please override execute method in subclass of CheckerMode::Base"
    end

    def encode(string, encoding)
      string.encode(encoding)
    rescue
      raise "Cannot use this string in #{encoding}"
    end

    def set_replacer(string)
      railse "please use Replace mode. [USAGE] SjisChecker.new(CheckerMode::Replace)"
    end
  
    def available?(string, encoding) 
      string.encode(encoding)
      true
    rescue
      false
    end
  end

  class Default < Base
    def execute(string, encoding)
      string.encode(encoding)
    rescue
      nil
    end
  end

  class Replace < Base
    attr_accessor :replacer

    # TODO 可変replacer
    def execute(string, encoding)
      replace(string, encoding)
    end

    def set_replacer(string)
      self.replacer = string
    end

    private
    def replace(string, encoding)
      original_string = string
      0.upto(original_string.length - 1) do |idx|
        char = original_string[idx]
        if available?(char, encoding) 
    
        else
          original_string[idx] = replacer || "?"
        end
      end
      original_string
    end
  end
end