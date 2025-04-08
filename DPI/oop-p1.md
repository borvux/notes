# Define method
```ruby
def some_method
  # does something
end

def square
  return 2 ** 2 # 2 * 2
end

def square(n)
  n ** 2 
end

def add(num1, num2)
  return num1 + num2 
end
```
# Define a Car class
A car class will have a make, model, year as the attributes 
```ruby
class Car
  def initialize
    @make = nil
    @model = nil
    @year = nil
  end

  def set_make(make)
    @make = make
  end

  def get_make
    @make # return @make
  end 

  # other setters/getters ...
end
```

```ruby
# another to do setter
def make=(new_make)
  @make = new_make
end
```

```ruby
# another way to do initialize
def initialize(make, model, year)
  @make = make
  @model = model
  @year = year
end
```

```ruby
# default values
def initialize(make, model, year=2020)
  @make = make
  @model = model
  @year = year
end

def initialize(items = nil)
  @items = items || [] # New array each time if not provided
end

def initialize(sold: true)
  @sold = sold
end
```
 
# using attributes writer/reader/accessor
remember to use `self.` instead of `@`
```ruby
attr_writer :make, :model, :year
attr_reader :make, :model, :year
```

```ruby
class Car
  attr_accessor :make, :model, :year
end

my_car = Car.new
my_car.make = "Toyota"
my_car.model = "Camry"
my_car.year = 2020
pp my_car  # Outputs a Car object with attributes
```
