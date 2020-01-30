class BoardCase
  attr_accessor :value
  
  def initialize ()
    @value =" "
  end

  def free
    return value == " "
  end
  
end
