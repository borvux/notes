```ruby
# animal.rb

# Define the parent class
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    "I am an animal."
  end
end

# Define a subclass Dog that inherits from Animal
class Dog < Animal
  def initialize(name, breed)
    super(name)  # Calls Animal's initialize method
    @breed = breed
  end

  def speak
    "#{super} Woof! My name is #{@name} and I am a #{@breed}."
  end
end

# Define a subclass Cat that inherits from Animal
class Cat < Animal
  def initialize(name, color)
    super(name)  # Calls Animal's initialize method
    @color = color
  end

  def speak
    "#{super} Meow! I'm #{@name}, a #{@color} cat."
  end
end

# Create instances of Dog and Cat
dog = Dog.new("Buddy", "Golden Retriever")
cat = Cat.new("Whiskers", "black")

# Display how each animal speaks
puts dog.speak
# Output: I am an animal. Woof! My name is Buddy and I am a Golden Retriever.

puts cat.speak
# Output: I am an animal. Meow! I'm Whiskers, a black cat.

```
```ruby
# audiobook.rb
require_relative "book"

class AudioBook < Book
  attr_reader :narrator, :duration

  def initialize(title, author, narrator, duration, checked_out = false)
    super(title, author, checked_out)
    @narrator = narrator
    @duration = duration # in minutes
  end
end
```

