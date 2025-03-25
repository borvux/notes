# Loops

## Type of loops
### while loop
```ruby
i = 1
while i <= 10
  puts i
  i += 1
end
```

### infinite loop
```ruby
while true
  puts "This loop will run forever."
end
```

### block loop
A block loop is a looping construct in Ruby that uses a block—an anonymous piece of code delimited by either `{ }` or `do ... end`
`i` is the `block parameter` or `block variable`, it receives the current iteration index (starting at 0) each time the block is executed
```ruby
(1..10).each do |i|
  puts i
end
```

### .times
```ruby
5.times do |i|
  puts i
end
```
​In Ruby, loops often start at 0 primarily due to the language's zero-based indexing system. This means that the first element of an array or other enumerable collection is accessed with index 0, the second element with index 1, and so on. This convention aligns with many programming languages like C and Java, where array indexing also begins at 0.

The rationale behind zero-based indexing is rooted in how memory addresses are calculated. An index represents an offset from the starting memory address of the array. Therefore, the first element is at the starting address plus zero offset, the second element is at the starting address plus one offset, and so forth. This approach simplifies the computation of memory addresses and is a common practice in many programming languages.

### .step
```ruby
10.step(1, -4) do |i|
  puts i
end
```
```ruby
1.step(10, 3) do |i|
  puts i
end
```

### .downto
```ruby
99.downto(90) do |i|
  puts i
end
```

### .upto
```ruby
5.upto(10) do |i|
  puts i
end
```

### for loop
```ruby
for i in 1..10
  puts i
end
```

### nested loop
```ruby
3.times do |i|
  puts "Outer loop iteration: #{i}"
  3.times do |j|
    puts "  Inner loop iteration: #{j}"
  end
end
```

### stars
```ruby
n = 5
(1..n).each do |i|
  puts '*' * i
end
```

### multiplication table
```ruby
(1..5).each do |i|
  (1..5).each do |j|
    product = i * j
    print "#{product}\t"
  end
  puts
end
```

### DSA
```ruby
(1..30).each do |number|
  if number.even? && number > 10
    puts "EvenBig"
  elsif number.even? && number <= 10
    puts "EvenSmall"
  elsif number.odd? && number % 7 == 0
    puts "OddSeven"
  else
    puts number
  end
end
```

```ruby
(5..35).each do |number|
  pp case
     when number.even? && number > 10
       "EvenBig"
     when number.even? && number <= 10
       "EvenSmall"
     when number.odd? && number % 7 == 0
       "OddSeven"
     else
       number
     end
end
```
