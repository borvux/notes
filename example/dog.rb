# dog.rb

require_relative "animal"

class Dog < Animal
  attr_reader :breed
  
  def initialize(name, breed)
    super(name)
    @breed = breed
  end

  def speak
    "Woof!"
  end
end
