# Step 1: Define the Book Class
- Attributes:
  - title: The name of the book.
  - author: The author of the book.
  - available: A boolean flag indicating if the book is available.

- Methods:
  - Initializer: Sets up the initial title, author, and sets the book as available (true).
  - check_out: Marks the book as not available.
  - return_book: Marks the book as available.
  - to_s: Provides a simple string representation for printing.

```ruby
class Book
  attr_accessor :title, :author, :available

  def initialize(title, author)
    @title = title
    @author = author
    @available = true  # The book is available by default.
  end

  def check_out
    @available = false
  end

  def return_book
    @available = true
  end

  def to_s
    status = available ? "Available" : "Checked Out"
    "#{title} by #{author} - #{status}"
  end
end

```

---
# Step 2: Define the Library Class
- Attributes:
  - books: An array that holds all Book objects.

- Methods:
  - Initializer: Creates an empty array for books.
  - add_book: Adds a new Book object to the library.
  - check_out_book: Accepts a title, finds the corresponding book, and if it’s available, marks it as checked out.

  - return_book: Accepts a title, finds the corresponding book, and returns it (marks it as available).

  - list_books: Prints out all books with their current status.

```ruby
class Library
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(book)
    books << book
  end

  def check_out_book(title)
    book = books.find { |b| b.title == title }
    if book && book.available
      book.check_out
      "You have successfully checked out '#{book.title}'."
    elsif book
      "Sorry, '#{book.title}' is already checked out."
    else
      "Book not found."
    end
  end

  def return_book(title)
    book = books.find { |b| b.title == title }
    if book && !book.available
      book.return_book
      "Thank you for returning '#{book.title}'."
    elsif book
      "'#{book.title}' is already available in the library."
    else
      "Book not found."
    end
  end

  def list_books
    books.each { |book| puts book.to_s }
  end
end
```

---

# Test out the system
```ruby
# Create library instance
library = Library.new

# Create book instances
book1 = Book.new("The Hobbit", "J.R.R. Tolkien")
book2 = Book.new("1984", "George Orwell")
book3 = Book.new("To Kill a Mockingbird", "Harper Lee")

# Add books to the library
library.add_book(book1)
library.add_book(book2)
library.add_book(book3)

# List all books in the library
puts "Library Inventory:"
library.list_books
puts "\n"

# Check out a book
puts library.check_out_book("1984")
puts "\nLibrary Inventory after checkout:"
library.list_books
puts "\n"

# Attempt to check out the same book again
puts library.check_out_book("1984")
puts "\n"

# Return the book
puts library.return_book("1984")
puts "\nLibrary Inventory after return:"
library.list_books
```
