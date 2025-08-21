# Strings

## Lecture: A Deep Dive into Ruby Strings

**(Start of Lecture)**

Hello everyone, and welcome\! Today, we're going to go beyond `"Hello, world!"` and unlock the full power of one of the most fundamental data types in any programming language: the **String**.

### The Big Picture: Humans, Computers, and Text

At the most basic level, computers think in numbers—specifically, 1s and 0s. They process electricity, on or off. But we humans communicate with words, sentences, and complex text.

So how do we bridge this gap? How does a computer understand your name, a tweet, or the source code of a program? The answer is **Strings**. In programming, a string is the data type we use to represent text. It’s an abstraction, a way for us to work with characters, words, and sentences, while the computer manages the complex binary code under the hood.

Our goal today is to understand how to create, manipulate, and work with text in Ruby.

-----

### 1\. What is a String? A Look Under the Hood

A string is a sequence of characters. It can be letters, numbers, symbols, or spaces. In Ruby, we create them by enclosing the text in single (`'`) or double (`"`) quotes.

```ruby
puts "This is a string."
puts 'This is also a string.'
puts "123 is a string, not a number."
puts ":) is a string, too!"
```

But what *is* a character, really? To a computer, a character is just a number. This mapping of characters to numbers is called an **encoding**.

  * **ASCII (American Standard Code for Information Interchange):** This was an early standard. It used 7 bits, allowing for 128 characters—enough for all the English letters (uppercase and lowercase), numbers, and common punctuation. For example, in ASCII, the letter `'A'` is represented by the number `65`, and `'B'` is `66`.
  * **The Problem:** The world has more than just English characters\! ASCII couldn't represent `é`, `ü`, `Я`, `你好`, or `😂`.
  * **Unicode:** This is the modern standard. Its goal is to provide a unique number for every character, no matter what the platform, program, or language.
  * **UTF-8:** This is the most common *implementation* of the Unicode standard. It's a clever, variable-width encoding. It uses only one byte (8 bits) for all the old ASCII characters, making it backward-compatible, but can use multiple bytes to represent every other character in existence.

Ruby uses UTF-8 by default, which is fantastic because it means we can handle text from virtually any language out of the box.

We can inspect this using code:

```ruby
puts "test".encoding   # => UTF-8
puts "A".ord           # => 65 (The Unicode/ASCII number for 'A')
puts 65.chr           # => "A" (The character for the number 65)
```

-----

### 2\. Creating and Combining Strings

#### Creation

As we saw, we use quotes. But there's a key difference between single and double quotes.

```ruby
greeting = "Hello, world!"
farewell = 'Goodbye!'
```

The most important difference is that **double-quoted strings support interpolation**.

#### Concatenation and Interpolation

**Concatenation** means joining strings together.

```ruby
first_name = "Ada"
last_name = "Lovelace"

# Method 1: The + operator (creates a new string)
full_name = first_name + " " + last_name
puts full_name # => "Ada Lovelace"

# Method 2: The << (shovel) operator (modifies the original string)
greeting = "Hello, "
greeting << first_name
puts greeting # => "Hello, Ada"

# Method 3: The .concat method (also modifies the original)
first_name.concat(" ", last_name)
puts first_name # => "Ada Lovelace"
```

While concatenation is useful, **interpolation** is often cleaner and more powerful. Interpolation lets you embed any Ruby expression directly inside a double-quoted string using the `#{...}` syntax.

```ruby
name = "Ruby"
puts "Hello, #{name}!"                 # => "Hello, Ruby!"
puts "The result of 5 * 3 is #{5 * 3}." # => "The result of 5 * 3 is 15."
```

> **Warning:** Interpolation *only* works with double quotes (`"`), not single quotes (`'`).
>
> ```ruby
> puts 'Hello, #{name}!' # => "Hello, #{name}!" (The code is not executed)
> ```

-----

### 3\. Getting User Input

Programs are more interesting when they're interactive. The `gets` method lets us read a line of text typed by a user.

```ruby
print "What is your name? "
name = gets
puts "Hello, #{name}!"
```

If you run this and type "Alice" and press Enter, you'll see something strange:

```text
What is your name? Alice
Hello, Alice
!
```

Why is the `!` on a new line? Because when you press Enter, you're not just submitting the text "Alice", you're also submitting an invisible newline character (`\n`). `gets` captures that too\!

To fix this, we use the `.chomp` method, which removes any trailing newline from a string. It's standard practice to chain it directly to `gets`.

```ruby
print "What is your name? "
name = gets.chomp # The fix!
puts "Hello, #{name}!"
```

Now the output is what we expect:

```text
What is your name? Alice
Hello, Alice!
```

-----

### 4\. The String Toolbox: Common Methods

Strings come with a huge library of built-in methods. Let's explore some of the most common ones.

```ruby
word = "  hello world  "

# Cleaning and Casing
puts word.strip          # => "hello world" (Removes leading/trailing whitespace)
puts word.upcase           # => "  HELLO WORLD  "
puts word.downcase         # => "  hello world  "
puts "ruby".capitalize    # => "Ruby"

# Inspection and Transformation
puts word.length         # => 15 (Includes the spaces)
puts word.reverse        # => "  dlrow olleh  "
puts "hello".chars        # => ["h", "e", "l", "l", "o"] (Returns an array of characters)
```

-----

### 5\. Accessing Parts of a String: Indexing and Slices

You can think of a string as a list of characters. Each character has an **index**, which is its position in the string. **Important:** Indexing starts at `0`, not `1`.

We use square brackets `[]` to access parts of a string.

```ruby
text = "Ruby"

# Access a single character by its index
puts text[0]    # => "R" (The first character)
puts text[1]    # => "u"
puts text[-1]   # => "y" (Negative index counts from the end)

# Get a "slice" (a substring) using a range
puts text[1..2] # => "ub" (Characters at index 1 and 2)
puts text[0..-2] # => "Rub" (From the beginning up to the second-to-last char)
```

This `[]` notation is what we call **syntax sugar**. It's a convenient shortcut for the `.slice` method.

-----

### 6\. Powerful Searching and Replacing

What if you need to find and replace text within a string? Ruby has `.sub` (substitute first occurrence) and `.gsub` (substitute globally) for this.

```ruby
phrase = "I love cats. All cats are great."

# .sub replaces only the first match
puts phrase.sub("cats", "dogs")
# => "I love dogs. All cats are great."

# .gsub replaces all matches
puts phrase.gsub("cats", "dogs")
# => "I love dogs. All dogs are great."
```

This becomes incredibly powerful when combined with **Regular Expressions** (or "regex"), which are patterns used to match text. A regex is typically enclosed in slashes `/.../`.

```ruby
data = "My phone is 555-1234 and my zip is 60187."

# Replace any digit (\d is regex for "any digit") with '#'
puts data.gsub(/\d/, "#")
# => "My phone is ###-#### and my zip is #####."

# Replace vowels with an asterisk
puts "hello world".gsub(/[aeiou]/, '*')
# => "h*ll* w*rld"
```

-----

### 7\. An Important Concept: Mutability

In Ruby, most objects are **mutable**, which means they can be changed in-place after they are created. Strings are mutable.

Let's see this in action. The `<<` (shovel) operator modifies the string directly.

```ruby
s = "Hi"
puts "Original object ID: #{s.object_id}" # Each object has a unique ID

s << " there" # This MODIFIES the existing string

puts s # => "Hi there"
puts "New object ID: #{s.object_id}" # The ID is the same!
```

In contrast, the `+` operator creates a brand new string.

```ruby
s = "Hi"
puts "Original object ID: #{s.object_id}"

s = s + " there" # This CREATES a new string and reassigns the variable s

puts s # => "Hi there"
puts "New object ID: #{s.object_id}" # The ID is different!
```

Sometimes you want to prevent a string from being changed. You can make it **immutable** by using the `.freeze` method.

```ruby
name = "Bob".freeze

# Now, any attempt to modify it will cause a crash.
name << "by" # This will raise a FrozenError: can't modify frozen String
```

-----

### 8\. Comparison and Syntax Sugar

#### Comparison

You can compare strings just like numbers.

```ruby
puts "apple" == "apple"    # => true (Are the values the same?)
puts "apple" == "Apple"    # => false (Comparison is case-sensitive)
puts "apple".eql?("Apple") # => false (Essentially the same as == for strings)

# You can also use < and > for alphabetical sorting
puts "a" < "b"             # => true
puts "cat" > "dog"         # => false
```

#### Syntax Sugar

We've seen this term a few times. Syntax sugar is just a shorter, sweeter way of writing something. In Ruby, many operators are actually just nice-looking method calls.

| "Sweet" Syntax | The Method Underneath | Purpose |
| :--- | :--- | :--- |
| `str1 + str2` | `str1.+(str2)` | Concatenation (new string) |
| `str << "more"` | `str.<<("more")` | Append (modifies original) |
| `str[0]` | `str.slice(0)` | Access character/slice |
| `str == "hi"` | `str.==("hi")` | Comparison |
| `"ha" * 3` | `str.*(3)` | Repetition (`"hahaha"`) |

-----

### Wrap-Up & Key Takeaways

You've learned a ton about strings today\!

  * **Under the Hood:** Strings are sequences of characters, represented by numbers using an encoding like UTF-8. You can inspect this with `.ord` and `.chr`.
  * **Creation:** Use `""` for interpolation (`#{...}`) and `''` for literal strings.
  * **Interaction:** Use `gets.chomp` to get clean user input.
  * **Manipulation:** You have a rich toolbox of methods like `.strip`, `.upcase`, `.reverse`, `.length`, etc.
  * **Access:** Use `[]` with an index or a range to get parts of a string.
  * **Substitution:** Use `.gsub` with a string or a powerful regular expression to find and replace text.
  * **Mutability:** Strings are mutable (changeable), but you can `.freeze` them to make them immutable.

Now, let's test that knowledge.
