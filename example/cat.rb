# cat.rb

require_relative "animal"

class Cat < Animal
  attr_reader :color

  def initialize(name, color)
    super(name)
    @color = color
  end

  def speak
    "Meow"
  end
end
