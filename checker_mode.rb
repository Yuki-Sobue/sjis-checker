module CheckerMode

  MAX_REPLACER = 1

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

    def execute(string, encoding)
      replace(string, encoding)
    end

    def set_replacer(string, encoding)
      replacer_validation(string, encoding)
      self.replacer = string 
    end

    def replacer_validation(string, encoding)
      raise "replacer must be 1 charactor" if string.length != MAX_REPLACER
      raise "this replacer cannot use" unless available?(string, encoding)
    end

    private
    def replace(string, encoding)
      target_string = string
      0.upto(target_string.length - 1) do |idx|
        char = target_string[idx]
        target_string[idx] = replacer || "?" unless available?(char, encoding) 
      end
      target_string
    end
  end
end