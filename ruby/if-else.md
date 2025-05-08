# If statements (conditionals)

## The basic anatomy of if statements
```ruby
if condition
  # code that runs if the condition is true
end
```
- First comes the `if` keyword.
    
- After the `if`, on the same line, comes any Ruby expression, which is evaluated until only one piece of data is left.
    
- If that final return value of `condition` is “truthy”, then the code on the lines between the `if` and `end` keywords is executed.

- If the final return value of `condition` is “falsy”, then the code on the lines between the `if` and `end` keywords is ignored.
    
- Either way, the program picks up execution on the next line after the `end` keyword and continues on.

## Don't forget the `end`
- Every `if` requires a matching `end`, and forgetting it is a very common mistake.

- My advice: type the `end` immediately after typing the if so that you don’t forget it; then worry about typing the condition, and the code that comes on the lines between the `if` and the `end`.

## Example If Statements
### Is it even?
```ruby
the_array = [5, 14, 19, 22, 30]
the_sample = the_array.sample

if the_sample.odd?
  pp "The number #{the_sample} is odd!"
end
```

## Multibranch if statements
### Multibranch example
```ruby
the_temp = rand(100)
pp the_temp

if the_temp < 32
  pp "Brrr, it's freezing outside!"
else
  pp "No need for a heavy jacket today."
end
```

### Using `elsif`
```ruby
the_temp = rand(100)
pp the_temp

if the_temp > 80
  pp "It's scorching out there!"
elsif the_temp > 50
  pp "Perfect weather for a walk!"
else
  pp "Bundle up, it's chilly!"
end
```

## Truthiness and Falsiness
- Why did I say “truthy” and “falsy” instead of just true and false? Because many — most — Ruby expressions return values other than true or false. Any expression can appear next to an if, and some will cause the code inside the if statement to execute (these values are known as “truthy”) and some will not (these are “falsy”).
```ruby
0
"false"
[]
nil
1 == 1
""
false

if # Replace this with each expression.
  pp "The expression is truthy."
else
  pp "The expression is falsy."
end
```
- It turns out that only `false` and `nil` are falsy. All other objects in Ruby are truthy — even `0`, `""`, and `[]`.

## Comparisons 
```ruby
==
!=
>
<
>=
<=
```

## Combining conditions with AND and OR
```ruby
# Check if a person can enter a club
age = 19
has_id = true
is_vip = false

if (age >= 18 && has_id) || is_vip
  pp "Welcome to the club!"
else
  pp "Entry denied."
end
```

## DSA Problem
Problem: "NumberClassifier"
Write a Ruby program that takes one number as input and:

- If the number is even and greater than 10, return "EvenBig".

- If the number is even and 10 or less, return "EvenSmall".

- If the number is odd and divisible by 7, return "OddSeven".

Otherwise, return the number itself.

Example 1:  
Input: `7` → Output: `"OddSeven"`  
Example 2:  
Input: `8` → Output: `"EvenSmall"`  
Example 3:  
Input: `12` → Output: `"EvenBig"`  
Example 4:  
Input: `3` → Output: `3` 

```ruby
print "Enter a number: "
num = gets.chomp.to_i

if num % 2 == 0
  if num > 10
    puts "EvenBig"
  else
    puts "EvenSmall"
  end
else
  if num % 7 == 0
    puts "OddSeven"
  else
    puts num
  end
end
```
