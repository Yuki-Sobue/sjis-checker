module CheckerMode
  class Base


    def execute(string)
      raise "please override execute method in subclass of CheckerMode::Base"
    end
  end

  class Default < Base

    def self.execute(string)
      string
    end
  end

  class Replace < Base
    def self.execute(string)
      string
    end
  end
end