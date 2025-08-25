# **Lecture: Working with Numbers in Ruby: Integers and Floats**

  * **Title:** Working with Numbers in Ruby: Integers and Floats
  * **Subtitle:** Understanding the fundamental building blocks for calculation and data.

**(Slide 2: Introduction - What Are "Types"? )**

Hello everyone, and welcome\! Today, we're going to dive into one of the most fundamental concepts in programming: how we represent and work with numbers.

In Ruby, everything is an **object**. Think of an object as a thing that not only holds a value but also has built-in abilities. A number isn't just a number; it's an object that knows things about itself and can perform actions.

The two most common types of numbers we'll work with are **Integers** (whole numbers) and **Floats** (numbers with decimals). Ruby treats them as separate classes, or blueprints, for objects.

How can you tell what class an object belongs to? You can ask it\! The `.class` method works on any object in Ruby.

```ruby
pp 7.class     # Output: Integer
pp 7.0.class   # Output: Float
```

Notice that tiny decimal point in `7.0` makes all the difference. Let's start by exploring the world of `Integers`.

-----

### **Part 1: The Integer Class (Whole Numbers)**

**(Slide 3: Integer Syntax)**

An `Integer` is simply a whole number, like -10, 0, or 42.

The syntax is straightforward: you just write the number. Ruby knows it's an `Integer`. One helpful trick for large numbers is using an underscore `_` as a delimiter. It doesn't change the value, but it makes the code much more readable.

```ruby
# Is this 1 million? 10 million?
10000000

# Ah, much easier to read.
10_000_000
```

**(Slide 4: Integer Methods - Basic Math)**

Since numbers are objects, they have methods (abilities). The most common ones are for math. Ruby gives us some nice "syntactic sugar" so we can write math expressions naturally.

Instead of writing `12.+(5)`, we can just write:

```ruby
pp 12 + 5  # => 17
pp 12 - 5  # => 7
pp 12 * 5  # => 60
```

**(Slide 5: A Wrinkle in Division)**

Now, let's try division. What do you expect this to output?

```ruby
pp 12 / 5
```

You might expect `2.4`, but the output is `2`. Why?

Because when you ask an `Integer` to divide by another `Integer`, it promises to give you an `Integer` back. It does this by dropping the remainder entirely, just like in elementary school division.

**(Slide 6: Modulus and Exponents)**

So how do we get the remainder? We use the **modulus** operator, which is the percent sign `%`.

```ruby
# To get the remainder of 12 divided by 5
pp 12 % 5  # => 2
```

This is incredibly useful for all sorts of tasks, like figuring out if a number is even or odd.

Another operator to know is for exponents (raising to a power). In Ruby, we don't use the caret `^`. We use a double-star `**`.

```ruby
# This calculates 3 squared (3²)
pp 3 ** 2  # => 9
```

**(Slide 7: Let's Practice: A Quick Problem)**

Let's solve a quick problem. If you divide the number of days in a regular year (365) by the number of days in a week (7), what is the remainder?

```ruby
days_in_year = 365
days_in_week = 7

pp days_in_year % days_in_week # => 1
```

There is one day left over, which is why each year the day of the week for a given date shifts by one\!

**(Slide 8: Asking Questions with Predicate Methods)**

Some methods are designed to ask a true or false question. In Ruby, these methods conventionally end with a question mark `?`.

`Integers` have two very handy ones: `.odd?` and `.even?`.

```ruby
pp 7.odd?   # => true
pp 7.even?  # => false
pp 10.even? # => true
```

**(Slide 9: Generating Random Numbers)**

We often need to generate random numbers for games, simulations, or statistical analysis. Ruby gives us a simple way to do this with the `rand` method.

If you give `rand` an integer argument, `n`, it will return a random integer between `0` and `n-1`.

**Important:** It's a range from `0` to `n-1`, *not* `1` to `n`.

```ruby
# Returns a random integer between 0 and 5
pp rand(6)

# Returns a random integer between 0 and 99
pp rand(100)
```

**(Slide 10: Bridging Worlds - Type Conversion)**

What happens when you get a number from a user or a file? It usually comes in as a `String`. You can't do math with a `String`\!

```ruby
first_num = "8"
second_num = "100"

# This will result in an error!
# pp first_num * second_num
```

To fix this, we need to convert the `String` object into an `Integer` object using the `.to_i` method.

```ruby
# This works!
pp first_num.to_i * second_num.to_i # => 800
```

This is a very common pattern: get input as a string, convert it to a number, do the math.

**(Slide 11: Converting Back to a String)**

The reverse is also true. If you want to combine a number with a string for output, you must convert the number to a string first using `.to_s`.

```ruby
lucky_number = rand(100)

# This will cause an error: no implicit conversion of Integer into String
# pp "Your lucky number is " + lucky_number

# This works perfectly!
pp "Your lucky number is " + lucky_number.to_s
```

A more modern way to do this is with **string interpolation**, which automatically calls `.to_s` for you.

```ruby
pp "Your lucky number is #{lucky_number}"
```

-----

### **Part 2: The Float Class (Decimal Numbers)**

**(Slide 12: Introduction to Floats)**

Now, let's talk about Ruby's other primary number type: the `Float`. A `Float` is a number with a decimal point. They are essential for when you need more precision than a whole number can offer.

Creating a `Float` is as simple as adding a decimal point.

```ruby
pp 5.class   # => Integer
pp 5.0.class # => Float
```

**(Slide 13: Float Division - The Way You Expect It)**

Remember how `Integer` division was a bit strange? `Float` division works just like you'd expect from a calculator. It returns a fractional, precise result as another `Float`.

```ruby
pp 12.0 / 5.0  # => 2.4
```

Here's the critical rule: **If either side of a division is a `Float`, the result will be a `Float`.**

```ruby
pp 12 / 5      # => 2 (Integer division)
pp 12.0 / 5    # => 2.4 (Float division)
pp 12 / 5.0    # => 2.4 (Float division)
```

This is why the `.to_f` method ("to float") is so useful. If you have two integers but need a precise answer, convert one to a `Float` first.

**(Slide 14: Advanced Math with Floats - Roots)**

We can use the exponent operator `**` with `Floats` to calculate roots. Remember from math class that the square root of 9 is the same as $9^{1/2}$, and the cube root of 8 is the same as $8^{1/3}$.

```ruby
# Calculate the square root of 9
pp 9 ** 0.5   # => 3.0

# Calculate the cube root of 8
pp 8 ** (1.0/3.0) # => 2.0
```

**(Slide 15: Let's Practice: Pythagorean Theorem)**

Let's use this to solve a real problem. The Pythagorean Theorem states that for a right triangle with sides `a` and `b`, the hypotenuse `c` is calculated as:
$$c = \sqrt{a^2 + b^2}$$
Which is the same as:
$$c = (a^2 + b^2)^{0.5}$$
Let's calculate `c` in Ruby:

```ruby
a = 2.8
b = 4.5

# Calculate c and print it
c = ((a**2) + (b**2))**0.5
puts c # => 5.3
```

**(Slide 16: Rounding Floats)**

Real-world calculations often result in `Floats` with many messy decimal places. We can clean them up using the `.round` method. You can also pass an argument to `.round` to specify how many decimal places you want to keep.

```ruby
pi = 3.1415926535

pp pi.round      # => 3
pp pi.round(2)   # => 3.14
pp pi.round(4)   # => 3.1416 (it rounds up correctly!)
```

**(Slide 17: Random Floats)**

What happens if we call the `rand` method with *no* arguments? It returns a random `Float` between 0.0 and 1.0. This is extremely handy for working with probabilities, percentages, or statistical sampling.

```ruby
# Generate a random float between 0.0 and up to (but not including) 1.0
pp rand
```

-----

**(Slide 18: Summary & Key Takeaways)**

Let's recap what we've learned.

  * **Two Main Number Types:**
      * `Integer` for whole numbers.
      * `Float` for decimal numbers.
  * **Key Differences in Division:**
      * `Integer / Integer` returns a truncated `Integer`.
      * If a `Float` is involved, you get a precise `Float` result.
  * **Essential Conversions:**
      * `.to_i`: Convert a `String` to an `Integer` for math.
      * `.to_s`: Convert a number to a `String` for output.
      * `.to_f`: Convert a number to a `Float` for precise division.
  * **The Big Idea:** In Ruby, numbers are powerful **objects** with built-in **methods**. You can "talk" to them and ask them to do things for you\!
