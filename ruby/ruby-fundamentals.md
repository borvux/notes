# Ruby Fundamentals

Hello everyone, and welcome to your introduction to the Ruby programming language.

### **1. Printing to the Console**

As tradition dictates, the first thing we do in any new language is make it say "hello, world". In Ruby, we have several ways to print text to our screen, or "console." The most common are `puts`, `print`, and `pp`. We're going to start with `pp`.

```ruby
pp("hello, world")
```

When we run this, `hello, world` appears on the screen. `pp` stands for "pretty print," and it's fantastic for displaying data in a clean, human-readable way.

As the tip in our lesson suggests, try using the others\!

  * `puts` ("put string") adds a new line after the output.
  * `print` does not add a new line.
  * `p` is similar to `pp` but is more of a raw inspection, showing you the exact Ruby object (including the quotes on a string).

-----

### **2. Understanding the Syntax**

Okay, so `pp("hello, world")` works, but what is actually happening? Let's break it down.

When Ruby sees this code, it understands it in three parts:

  * **The Receiver:** This is the *object* that receives the command. In this case, it's a special, invisible object called `self`, which represents the main program environment we're running in.
  * **The Method:** This is the *action* or *message* we are sending to the receiver. Here, the method is `pp`.
  * **The Argument:** This is the *input* the method needs to do its job. Our argument is the string `"hello, world"`.

So, you can think of it as: "Hey, `self`, run your `pp` method with this `"hello, world"` string."

Because Ruby assumes `self` if you don't specify another receiver, typing `pp("hello, world")` is just a shortcut for `self.pp("hello, world")`.

Also, notice the parentheses. In Ruby, these are often optional. You could write:

```ruby
pp "hello, world"
```

This looks a bit more like a natural sentence, but as the warning in our guide notes, it's generally better to **use parentheses** when you have multiple arguments or complex operations to make your code clearer.

Finally, a quick note on style: **casing matters**.

  * `variable_names` and `method_names` use `snake_case`.
  * `ClassNames` use `CapitalizedCamelCase`.
  * `CONSTANTS` use `ALL_CAPS`.
    Sticking to these conventions makes your code readable to other Ruby developers.

-----

### **3. Everything is an Object (And Why This is Important)**

This is the single most important concept in Ruby. **Everything is an object.** Numbers, text, lists—they are all objects.

Think of an object like a real-world thing. A cat is an object. It has properties (name, color, age) and it can perform actions (meow, sleep, purr).

In Ruby, our code objects are the same.
The string `"hello"` is an object. It has properties (like its length) and it can perform actions, which we call **methods**.

```ruby
# The "hello" object receives the "upcase" method.
pp "hello".upcase
#=> "HELLO"
```

Even numbers are objects with their own methods\!

```ruby
# The number 5 object receives the "next" method.
pp 5.next
#=> 6
```

This brings us to the crucial question: **Why is it so important that everything is an object?**

There are three huge benefits to this philosophy:

**1. Consistency and Predictability:**
Because everything is an object, there is one, single way to interact with anything in the language: `object.method(arguments)`. You don't need to memorize different rules for different data types. The syntax for getting the length of a string (`"abc".length`) is the same as asking a number if it's odd (`7.odd?`). This consistency makes the language incredibly easy to learn and reason about.

**2. Power and Expressiveness:**
This design makes simple data surprisingly powerful. A number isn't just a value; it's an object that can do things. We can ask a number to repeat an action five times with `5.times do ... end`. We're not just manipulating data; we're sending messages to capable objects, which lets us write very clear, expressive code that often reads like plain English.

**3. Discoverability and Exploration:**
Since everything is an object, we can ask any object about itself. This is a superpower when you're learning or debugging. Open up Interactive Ruby (`irb`) and try this:

```ruby
# In irb
my_string = "hello"
pp my_string.class      #=> String
pp 42.class            #=> Integer

# You can even ask an object what it can do!
pp my_string.methods.sort
```

You will get a giant list of all the methods a String object can respond to. This means you can explore the language as you use it. You don't have to have the documentation open for everything; you can interrogate the objects themselves.

This philosophy is the foundation that allows advanced frameworks like Ruby on Rails to work their magic. It all starts here.

-----

### **4. Variables**

A variable is just a name we give to an object—a label for a box that stores something. We use the `=` assignment operator to do this.

```ruby
# We store the string object "hello, world" in a variable named greeting.
greeting = "hello, world"

# Now we can use the variable instead of the string itself.
pp greeting
```

As the guide suggests, please be descriptive with your variable names. `customer_first_name` is much better than `x`. It makes your code self-documenting.

-----

### **5. Error Messages**

Let's break something. What happens if we ask Ruby to run a method that doesn't exist?

```ruby
kaboom!
```

This crashes and gives us an error. It looks scary, but it's your best friend. **You must read the error message.**

`-e:1:in '<main>': undefined local variable or method 'kaboom!' for main (NameError)`

Let's decode it, just like in our guide:

1.  `-e:1`: The error is on line 1.
2.  `in '<main>'`: It happened at the top level of our program.
3.  `undefined local variable or method 'kaboom!'`: This is the key\! Ruby says, "I looked for a variable or a method named `kaboom!` and I couldn't find one."
4.  `(NameError)`: This is the type of error.

The error message tells you exactly what went wrong and where. Learning to read them is the \#1 skill for becoming a programmer.

-----

### **6. Code Comments & Other Essentials**

  * **Comments**: Anything after a `#` is a comment. Ruby ignores it, but humans need it to understand complex code. Use them\!

    ```ruby
    # This line calculates the final price
    final_price = base_price + tax
    ```

  * **Data Types**: Ruby has many data types. The most common are `String` (text), `Integer` (whole numbers), `Float` (decimals), `Array` (ordered lists), and `Hash` (key-value dictionaries). We will cover these in detail soon.

  * **How to Run Ruby**: Remember, you can run a file with `ruby my_file.rb`, or you can experiment in Interactive Ruby with the command `irb`.

  * **Read the Documentation**: No one remembers everything. A professional developer is good at looking things up. Bookmark the Ruby docs—you will use them daily.

-----

### **Lesson 1: The Core of Ruby - Objects, Methods, and Expressions**

Everything in Ruby follows a primary syntax. Let's look at our first example. Instead of using the `+` sign like on a calculator, we'll do it the "Ruby way."

```ruby
2.add(3)
```

This is called an **expression**. Let's break it down using the official terminology:

  * **`2`**: This is the **object**, also known as the **receiver**. Think of it as the noun—the *thing* we are working with.
  * **`.add(3)`**: This is the **method**, also known as the **message**. Think of it as the verb—the *action* we are asking the object to perform.
      * **`add`**: This is the **name** of the method.
      * **`(3)`**: This is the **argument**, which is the input the method needs to do its job.

When Ruby sees this expression, it **evaluates** it. The method is executed, and the expression is replaced by its **return value**.

So, the expression `2.add(3)` evaluates and returns the object `5`.

#### **Making the Invisible Visible with `pp`**

But if we just save this in a file called `my_program.rb` and run it, what happens?

```ruby
# my_program.rb
2.add(3)
```

```bash
ruby my_program.rb
# No output!
```

Ruby doesn't automatically show us the result of every line. We have to explicitly tell it what we want to see. For this, we'll use a special method called `pp`, which stands for "pretty print."

To print the result, we have to call the `pp` method on the main program object, which is represented by a special keyword: `self`.

```ruby
# my_program.rb
self.pp(2.add(3))
```

```bash
# Terminal Output
5
```

Great\! Now we can see our results. `self.pp()` is our window into what our code is doing. It's how we **make the invisible visible**.

#### **Order of Operations**

Ruby evaluates the most deeply nested, complete expression first.

```ruby
# Consider this expression:
self.pp(4.add(6.divided_by(2)))
```

1.  Ruby finds the first complete, self-contained expression: `6.divided_by(2)`.
2.  It evaluates this, which returns `3`.
3.  The line is now effectively: `self.pp(4.add(3))`.
4.  It evaluates `4.add(3)`, which returns `7`.
5.  Finally, `self.pp(7)` is executed, and we see `7` in our output.

-----

### **Lesson 2: Syntactic Sugar - Making Our Code Cleaner**

Having to type `self.pp()` all the time is a bit tedious. Thankfully, Ruby provides some shortcuts, often called "syntactic sugar," to make our lives easier.

**Shortcut 1: `self` is the Implicit Receiver**
If you are calling a method on `self`, you can leave it out. Ruby assumes you mean `self` if you don't specify any other object.

So, `self.pp(2.add(3))` can be written as:

```ruby
pp(2.add(3))
```

**Shortcut 2: Dropping Parentheses Around Arguments**
For many methods, including `pp`, you can leave out the parentheses around the arguments.

So, `pp(2.add(3))` can be written as:

```ruby
pp 2.add(3)
```

This is the style we'll use from now on. It makes it incredibly easy to quickly see the result of any line of code by just adding `pp` to the beginning.

-----

### **Lesson 3: Variables are Boxes**

So far, we've just been printing return values. To build useful programs, we need to *store* those values for later. We do this using **variables**. The best way to think of a variable is as a labeled box where you can store one thing at a time.

We use the single equals sign `=`, called the **variable assignment operator**, to put a value into a box.

```ruby
# The expression on the right is evaluated FIRST.
# "hello world!".upcase returns "HELLO WORLD!"
# Then, that return value is stored in the box labeled 'upcased_greeting'.
upcased_greeting = "hello world!".upcase

# Now we can use the variable to see what's inside the box.
pp upcased_greeting
#=> "HELLO WORLD!"
```

#### **Updating Variables**

Most methods in Ruby **do not change the original object**. They return a *new, modified copy*.

Watch this:

```ruby
upcased_greeting = "HELLO WORLD!"

# We call .reverse on the variable, but we don't store the return value.
upcased_greeting.reverse

# What's in the box now?
pp upcased_greeting
#=> "HELLO WORLD!"  -- It hasn't changed!
```

To make progress, we need to store the return value of each step. We can do this by updating the variable with its own modified version.

```ruby
# Step 1: Create the variable.
my_string = "hello, world!"
pp my_string
#=> "hello, world!"

# Step 2: Update the variable with a capitalized version of itself.
my_string = my_string.capitalize
pp my_string
#=> "Hello, world!"

# Step 3: Update it again with a reversed version.
my_string = my_string.reverse
pp my_string
#=> "!dlrow ,olleH"
```

This pattern, `variable = variable.some_method`, is extremely common. Remember: Ruby evaluates the entire right side first, and *then* places the final result back into the box on the left.

-----

### **Lesson 4: Expanding Our Vocabulary - Strings and User Input**

The `object.method` pattern applies to all kinds of data. Let's explore some useful String methods.

```ruby
pp "Mississippi".length    #=> 11
pp "Raghu Betina".reverse  #=> "aniteB uhgaR"

# .gsub stands for "globally substitute"
# It takes two arguments: what to find, and what to replace it with.
pp "Java is a joy".gsub("Java", "Ruby")
#=> "Ruby is a joy"
```

#### **Getting User Input**

We can make our programs interactive by getting input from the user. We'll use the `gets` method for this. `gets.chomp` grabs the user's text and removes the invisible newline character from the end.

```ruby
pp "What is your name?"
user_name = gets.chomp

greeting = "Welcome, #{user_name}!"
pp greeting.upcase
```

-----

### **Lesson 5: Error Messages: Our Best Friends**

What happens if we try to call a method on an object that doesn't have it?

```ruby
# Numbers have an .even? method, but Strings do not.
pp "Mississippi".even?
```

This will crash our program and give us an error message. **Do not panic\!** This is the most important skill to learn: **Read. The. Error. Message. (RTEM)**.

You will see something like this:
`... undefined method 'even?' for "Mississippi":String (NoMethodError)`

Let's decode it:

  * `undefined method 'even?'`: This tells you the name of the method Ruby couldn't find.
  * `for "Mississippi":String`: This tells you the object (`"Mississippi"`) and its class (`String`) that you tried to call the method on.
  * `(NoMethodError)`: This is the official name of this type of error.

The message is telling us, "Sorry, the String class doesn't have a method named `even?`." Error messages are not your enemy; they are your most helpful guide.

-----

### **Lesson 6: Next Steps - Collections & Loops**

Now that we have mastered the fundamental syntax, we can apply it to more complex objects.

An **Array** is an object that holds an ordered list of other objects.

```ruby
students = ["Alice", "Bob", "Charlie"]
```

An **Hash** is an object that holds a dictionary of `key: value` pairs.

```ruby
student_profile = { name: "Bob", age: 22, major: "Computer Science" }
```

These objects have their own powerful methods. One of the most common is `.each`, which lets us loop.

```ruby
students = ["Alice", "Bob", "Charlie"]

# The Array is the object, .each is the method.
students.each do |student|
  pp "Hello, #{student}!"
end
```

See? It's the same `object.method` pattern again. Master that, and you've mastered the foundation of Ruby. Happy coding\!
