module CheckerMode
  class Base
    def execute(string)
      raise "please override execute method in subclass of CheckerMode::Base"
    end

    def encode(string, encoding)
      begin
        string.encode(encoding)
      rescue
        raise "Cannot use this string in #{encoding}"
      end
    end
  
    def available?(string, encoding) 
      begin
        string.encode(encoding)
      true
      rescue
        false
      end
    end
  end

  class Default < Base
    def execute(string, encoding)
      string.encode(encoding)
    rescue
        nil
    end
  end

  # class Replace < Base
  #   attr_accessor :replacer, :string

  #   def initalize(char = " ")
  #      self.replacer = char.to_s
  #   end

  #   # TODO replace
  #   def execute(string)
  #     self.string = string.encode(encoding)
  #   rescue
  #     nil
  #     # replace
  #   end

  #   def set_replacer(string)
  #     self.replacer = string
  #   end

  #   private
  #   def replace

  #   end
  # end
end