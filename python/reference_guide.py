"""
Python Reference Guide for Beginners
======================================
This file is a comprehensive reference guide covering Python’s fundamentals.
It includes examples for basic syntax, data types, operators, control flow,
data structures, functions, modules, file I/O, object-oriented programming,
exception handling, generators, decorators, and more.
"""

# --------------------------
# Basic Syntax & Data Types
# --------------------------
# Comments:
#   - Single-line comments start with a '#'.
#   - Multi-line (docstring) comments use triple quotes.
# Examples:
#   # This is a comment
#   """This is a multi-line comment"""

age = 25             # integer
price = 19.99        # float
name = "Alice"       # string
is_active = True     # boolean

# Type conversion (casting):
x = int("42")        # x becomes 42 (int)
y = float("3.14")    # y becomes 3.14 (float)
z = str(100)         # z becomes "100" (string)

# --------------------------
# Operators
# --------------------------
# Arithmetic operators: +, -, *, / (true division), // (floor division), %, ** (exponentiation)
a = 10 + 5           # 15
b = 10 / 3           # 3.3333...
c = 10 // 3          # 3
d = 2 ** 3           # 8

# Comparison operators: ==, !=, <, >, <=, >=
# Logical operators: and, or, not
if (age > 18) and is_active:
    print("Adult and active")

# Assignment operators (augmented):
counter = 0
counter += 1       # counter now equals 1

# --------------------------
# Control Flow
# --------------------------
# Conditional statements:
if age >= 18:
    print("Adult")
elif age >= 13:
    print("Teen")
else:
    print("Child")

# For loop:
for i in range(5):
    print("For loop iteration:", i)

# While loop:
count = 0
while count < 5:
    print("While loop iteration:", count)
    count += 1

# Break and continue:
for num in range(10):
    if num == 5:
        break   # exit the loop when num equals 5
    if num % 2 == 0:
        continue  # skip even numbers
    print("Loop with break/continue:", num)

# --------------------------
# Basic Data Structures
# --------------------------
# Lists (ordered, mutable sequences):
fruits = ["apple", "banana", "cherry"]
fruits.append("date")
print("First fruit:", fruits[0])       # 'apple'
print("Last fruit:", fruits[-1])         # 'date'

# Tuples (ordered, immutable sequences):
point = (10, 20)

# Dictionaries (key-value mappings):
student = {"name": "Alice", "age": 21}
print("Student name:", student["name"])
student["age"] = 22

# Sets (unordered collections of unique items):
numbers = {1, 2, 3, 2}
print("Set of numbers:", numbers)        # {1, 2, 3}

# List comprehension:
squares = [x**2 for x in range(1, 6)]
print("Squares:", squares)

# --------------------------
# Functions
# --------------------------
# Defining and calling functions:
def greet(name):
    """Return a greeting for the given name."""
    return f"Hello, {name}!"

print(greet("Alice"))

# Default parameters & keyword arguments:
def add(x, y=10):
    """Return the sum of x and y, with y defaulting to 10."""
    return x + y

print("add(5):", add(5))
print("add(5, 20):", add(5, 20))

# Anonymous function (lambda):
square = lambda x: x**2
print("Square of 4:", square(4))

# Returning multiple values:
def stats(numbers):
    """Return the sum and count of the numbers in the list."""
    total = sum(numbers)
    count = len(numbers)
    return total, count

total, count = stats([1, 2, 3])
print("Total:", total, "Count:", count)

# --------------------------
# Modules & Packages
# --------------------------
import math
print("Square root of 16:", math.sqrt(16))

import numpy as np
arr = np.array([1, 2, 3])
print("Numpy array:", arr)

from math import pi, sin
print("Value of pi:", pi)

# --------------------------
# File I/O
# --------------------------
# Writing to a file:
with open("output.txt", "w", encoding="utf8") as file:
    file.write("Hello, file!\nThis is a Python reference guide.\n")

# Reading from a file:
with open("output.txt", "r", encoding="utf8") as file:
    content = file.read()
    print("File content:\n", content)

# --------------------------
# Object-Oriented Programming (OOP)
# --------------------------
# Defining classes and creating objects:
class Dog:
    def __init__(self, name):
        self.name = name

    def bark(self):
        return f"{self.name} says Woof!"

my_dog = Dog("Buddy")
print("Dog barks:", my_dog.bark())

# Inheritance:
class Animal:
    def speak(self):
        return "Some sound"

class Cat(Animal):
    def speak(self):
        return "Meow"

kitty = Cat()
print("Cat speaks:", kitty.speak())

# Class and static methods:
class MathHelper:
    @staticmethod
    def add(a, b):
        return a + b

    @classmethod
    def info(cls):
        return f"This is {cls.__name__}"

print("MathHelper.add(5, 7):", MathHelper.add(5, 7))
print("MathHelper.info():", MathHelper.info())

# --------------------------
# Exception Handling
# --------------------------
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero!")
finally:
    print("Cleanup actions can be performed here.")

def check_positive(x):
    if x < 0:
        raise ValueError("Only positive numbers are allowed!")
    return x

# Uncomment the following line to see exception handling in action:
# check_positive(-5)

# --------------------------
# Advanced Topics
# --------------------------
# Generators: functions that yield values one at a time
def countdown(n):
    """Yield numbers from n down to 1."""
    while n > 0:
        yield n
        n -= 1

for number in countdown(5):
    print("Countdown:", number)

# Decorators: functions that modify other functions
def my_decorator(func):
    def wrapper(*args, **kwargs):
        print("Before function call")
        result = func(*args, **kwargs)
        print("After function call")
        return result
    return wrapper

@my_decorator
def say_hi():
    print("Hi!")

say_hi()
