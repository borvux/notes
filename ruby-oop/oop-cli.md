```ruby
require_relative "book"

class Audiobook < Book
  attr_reader :duration
  attr_reader :narrator

  def initialize(title, author, narrator, duration_minutes, checked_out = false)
    super(title, author, checked_out)
    self.narrator = narrator
    @duration = duration_minutes
  end

  def narrator=(input)
    @narrator = input.titleize
  end

  def formatted_duration
    total_minutes = @duration.to_i
    hours = total_minutes / 60
    minutes = total_minutes % 60

    if hours > 0
      "#{hours} hour#{'s' unless hours == 1}, #{minutes} minute#{'s' unless minutes == 1}"
    else
      "#{minutes} minute#{'s' unless minutes == 1}"
    end
  end

  def to_s
    duration_str = formatted_duration
    "#{title} by #{author}, narrated by #{@narrator} (#{duration_str}) - #{@checked_out ? "Checked out" : "Available"}"
  end
end
```

```ruby
require "active_support/all"

class Book
  attr_reader :title, :author
  attr_accessor :checked_out

  def initialize(title, author, checked_out = false)
    self.title = title
    self.author = author
    @checked_out = checked_out
  end

  def title=(input)
    raise "Title must be a non-empty string" unless input.is_a?(String) && !input.strip.empty?
    @title = input.strip.titleize
  end

  def author=(input)
    raise "Author must be a non-empty string" unless input.is_a?(String) && !input.strip.empty?
    @author = input.strip.titleize
  end

  def check_out
    if @checked_out
      puts "'#{title}' is already checked out."
      false
    else
      @checked_out = true
      puts "'#{title}' checked out successfully."
      true
    end
  end

  def return
    if !@checked_out
      puts "'#{title}' is already checked in."
      false
    else
      @checked_out = false
      puts "'#{title}' returned successfully."
      true
    end
  end

  def to_s
    "#{title} by #{author} - #{@checked_out ? "Checked out" : "Available"}"
  end
end
```

```ruby
class Library
  def initialize(books = [])
    @books = books
  end

  def add_book(book)
    @books.push(book)
  end

  def check_out_book(title)
    book = self.search_by_title(title)

    if book.nil?
      puts "Book not found"
    else
      book.check_out
    end
  end

  def return_book(title)
    book = self.search_by_title(title)

    if book.nil?
      puts "Book not found"
    else
      book.return
    end
  end

  def list_items
    puts "\n--- Library Catalog ---"
    @books.each_with_index do |item, index|
      puts "#{index + 1}. #{item.to_s}"
    end
    puts "---------------------"
  end

  private

  def search_by_title(title)
    @books.find { |book| book.title == title }
  end
end
```

```ruby
require_relative 'book'
require_relative 'audiobook'
require_relative 'library'

def get_input(prompt)
  print "#{prompt}: "
  gets.chomp
end

my_library = Library.new
my_library.add_book(Book.new("The Hobbit", "J.R.R. Tolkien"))
my_library.add_book(Audiobook.new("Project Hail Mary", "Andy Weir", "Ray Porter", 960))

while true do
  puts "\n========== Library Menu =========="
  puts "1. List all items"
  puts "2. Add a new Book"
  puts "3. Add a new Audiobook"
  puts "4. Check out an item"
  puts "5. Return an item"
  puts "6. Exit"
  print "Choose an option (1-6): "

  choice = gets.chomp

  case choice
  when '1'
    my_library.list_items

  when '2'
    puts "\n-- Add New Book --"
    title = get_input("Enter Title")
    author = get_input("Enter Author")
    new_book = Book.new(title, author)
    my_library.add_book(new_book)

  when '3'
    puts "\n-- Add New Audiobook --"
    title = get_input("Enter Title")
    author = get_input("Enter Author")
    narrator = get_input("Enter Narrator")
    duration_str = get_input("Enter Duration (in minutes)")
    duration = duration_str.to_i
    new_audiobook = Audiobook.new(title, author, narrator, duration)
    my_library.add_book(new_audiobook)

  when '4'
    puts "\n-- Check Out Item --"
    title = get_input("Enter title to check out")
    my_library.check_out_book(title)

  when '5'
    puts "\n-- Return Item --"
    title = get_input("Enter title to return")
    my_library.return_book(title)

  when '6'
    break
  end

  puts "\nPress Enter to continue..."
  gets
end
```
