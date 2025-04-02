#  Enumerables 
- ( eee - nuuu - merrr - a - ble )
- which are sets of powerful methods that allows us to traverse, search, and manipulate collections in ruby.

- Now that we understand looping on arrays and hashes. We are now going to talk about more methods to iterate through collections other than just `.each`

# .each_with_index
```ruby
colors.each_with_index do |color, index|
  pp "Color #{index + 1} is #{color} and has #{color.length} letters!"
end
```

# .each_char
```ruby
string = "hello, world"
count = 0
vowels = "aeiou"

string.each_char do |char|
	if vowels.include?(char)
		count += 1
		pp char
	end
end

pp "There are #{count} vowels"
```

# .map
```ruby
names = ["emma", "liam", "olivia", "noah", "ava"]
shouted_names = names.map { |name| name.upcase + "!" }
pp shouted_names
```

# .select/.reject/.find/.find_all
```ruby
numbers = (1..20).to_a.sample(8)

# Find the first multiple of 5
first_multiple_of_5 = numbers.find { |n| n % 5 == 0 }

# Collect all other multiples of 3 (including those also divisible by 5)
multiples_of_3 = numbers.select { |n| n % 3 == 0 }

# Collect numbers neither divisible by 3 nor 5
non_multiples = numbers.reject { |n| n % 3 == 0 || n % 5 == 0 }

pp first_multiple_of_5
pp multiples_of_3
pp non_multiples
```

# Syntaxes 
`do...end`
```ruby
numbers = [1, 2, 3, 4, 5]

numbers.each do |number|
  pp number * number
  pp number + 1
end
```

`{}`
```ruby
numbers = [1, 2, 3, 4, 5]

squares = numbers.map { |number| number * number }

pp squares
```

`&` shorthand is a way to convert a symbol representing a method name into a block that calls that method on each element of the collection. This shorthand can be used with any method that takes a block, such as map, select, reject, and others.

For example, consider the following code that uses map to convert an array of strings to uppercase:
```ruby
words = ["hello", "world", "ruby"]
upcased = words.map { |word| word.upcase }
# or 
upcased = words.map(&:upcase)
```

```ruby
numbers = [1, 2, 3, 4, 5]
evens = numbers.select { |n| n.even? }
# or 
evens = numbers.select(&:even?)
```

```ruby
strings = ["", "hello", nil, "ruby"]
non_empty = strings.reject { |s| s.nil? || s.empty? }
# or 
non_empty = strings.reject(&:nil?).reject(&:empty?)
```




----





### **1. `.each_with_index`**  
**Problem:**  
Create a program that takes an array of colors and prints each color along with its position (index) **and the length of its name**.  

**Example Input:**  
`colors = ["red", "green", "blue", "yellow"]`  

**Expected Output:**  
```  
Color 1 is red and has 3 letters!  
Color 2 is green and has 5 letters!  
Color 3 is blue and has 4 letters!  
Color 4 is yellow and has 6 letters!  
```  

---

### **2. `.each_char`**  
**Problem:**  
Given a string, **count the vowels** and print each vowel on a new line, followed by the total count.  

**Example Input:**  
`string = "hello, world"`  

**Expected Output:**  
```  
e  
o  
o  
There are 3 vowels.  
```  

---

### **3. `.map`**  
**Problem:**  
Transform an array of guest names into excited shouts.

**Example Input:**  
`names = ["emma", "liam", "olivia", "noah", "ava"]`  

**Expected Output:**  
`["EMMA!", "LIAM!", "OLIVIA!", "NOAH!", "AVA!"]`  

---

### **4. `.select`/`.reject`/`.find`/`.find_all`**  
**Problem:**  
Create a program that splits an array of random numbers (1-100) into:  
1. The **first multiple of 5** (using `find`).  
2. **All other multiples of 3** (using `find_all`/`select`).  
3. **Numbers that are neither multiples of 3 nor 5** (using `reject`).  

**Example Input:**  
`numbers = [9, 8, 38, 30, 16, 4, 2, 31]`  

**Expected Output:**  
```  
30  
[9, 30]  
[8, 38, 16, 4, 2, 31]  
```  
