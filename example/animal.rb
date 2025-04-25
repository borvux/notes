# animal.rb

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    raise "Not Implemented"
  end
end
