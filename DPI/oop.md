# Object-Oriented Programming (OOP)

## Definition
- A programming paradigm centered around **objects** (data + behavior) and **classes** (blueprints).
- Models real-world entities with **attributes** (data) and **methods** (actions).
- Emphasizes **modularity**, **reusability**, and **maintainability**.

---

## Core Principles
### 1. Encapsulation
- Keeping the messy, complicated parts of how something works hidden inside, and only giving people a simple, safe way to use it.

- Use `private`/`public` methods for control.  
  **Example**:  
  ```ruby
  class BankAccount
    def initialize(balance)
      @balance = balance
    end

    # Public method to read balance
    def get_balance
      @balance
    end

    # Public method to modify balance
    def deposit(amount)
      @balance += amount if amount > 0
    end

    # Keep @balance private
    private :balance
  end
  ```

### 2. Inheritance
- Subclasses inherit properties/methods from parent classes.  
  **Example**:  
  ```ruby
  class Vehicle
    def start_engine
      "Engine on!"
    end
  end

  class Car < Vehicle # Inherits start_engine
    def drive
      "Vroom!"
    end
  end
  ```

### 3. Polymorphism
- Objects of different classes respond to the same method.  
  **Example**:  
  ```ruby
  class Bird
    def fly
      "Flapping wings!"
    end
  end

  class Plane
    def fly
      "Jet engines!"
    end
  end
  ```

### 4. Abstraction
- Simplify complexity by exposing only essential features.  
  **Example**: A `CoffeeMachine` hides brewing logic behind a `brew` method.

---

## Why Use OOP?
- ✅ **Modularity**: Isolated, reusable components (objects).
- ✅ **Reusability**: Inherit or compose existing classes.
- ✅ **Maintainability**: Fix/update one class without breaking others.
- ✅ **Scalability**: Extend systems easily with new classes.

---

## Ruby’s OOP Features
### Everything is an Object
- Even primitives: `1.class # => Integer`, `true.methods`.

<img src="/Users/dpi-pttl-031/Workspace/notes/assets/object-meme.png">

### Mixins via Modules
- Share behavior without inheritance.  
  **Example**:  
  ```ruby
  module Swimmable
    def swim
      "Splashing!"
    end
  end

  class Duck
    include Swimmable
  end
  ```
