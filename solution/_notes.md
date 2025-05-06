## book.rb
```ruby
def title=(input)
  # TODO
  raise "Title cannot be empty." if input.strip.empty? # TODO
  @title = input.titleize
end

def author=(input)
  # TODO
  raise "Author cannot be empty." if input.strip.empty? # TODO
  @author = input.titleize
end
```
## audiobook.rb
`\A`: The string starts.  
`[1-9]`: The first character is '1', which matches this requirement (it's between '1' and '9').  
`\d*`: The next characters are '0' and '0'. Both are digits (`\d`), and the * allows for zero or more digits. So, "00" matches this part.  
`\z`: The string ends immediately after the last '0'.  
```ruby
# TODO
DURATION_REGEX = /\A[1-9]\d*\z/
# TODO
def duration=(input)
  string_input = input.to_s # TODO
  raise "Duration cannot be empty." if string_input.strip.empty? # TODO
  raise "Duration must be a valid integer." unless string_input.match?(DURATION_REGEX) # TODO
  @duration = input.to_i # TODO
end
```
## library.rb
```ruby
def search_by_title(title)
  # TODO 
  @books.find { |book| book.title.downcase == title.downcase } # TODO
end
```
## test_book.rb
```ruby
# test/simple_test_book.rb
require 'minitest/autorun'
require_relative '../book' # Adjust path if needed

class TestBook < Minitest::Test

  # Test 1: Can we create a book and are the basic attributes accessible?
  def test_book_creation
    book = Book.new("Simple Title", "Simple Author")
    assert_equal "Simple Title", book.title
    assert_equal "Simple Author", book.author
    assert_equal false, book.checked_out # Is it available by default?
  end

  # Test 2: Does check_out and return_item change the status? (Basic check)
  def test_book_checkout_and_return
    book = Book.new("Another Book", "Some Author")
    book.check_out
    assert_equal true, book.checked_out # Is it checked out?

    book.return_item
    assert_equal false, book.checked_out # Is it available again?
  end

  # Test 3: Does to_s give us a string?
  def test_book_to_s
    book = Book.new("Test String Book", "String Author")
    # Just check if the output is a string and contains the title
    assert_instance_of String, book.to_s
    assert book.to_s.include?("Test String Book")
  end
end
```
## test_audiobook.rb
```ruby
# test/simple_test_audiobook.rb
require 'minitest/autorun'
require_relative '../audiobook' # Adjust path if needed

class TestAudiobook < Minitest::Test

  # Test 1: Can we create an audiobook with its specific attributes?
  def test_audiobook_creation
    # Use known valid inputs
    audiobook = Audiobook.new("Audio Title", "Audio Author", "Narrator Name", 120)

    assert_instance_of Audiobook, audiobook
    assert_equal "Audio Title", audiobook.title # Inherited
    assert_equal "Narrator Name", audiobook.narrator
    assert_equal 120, audiobook.duration
  end

  # Test 2: Does the string representation include audiobook details?
  def test_audiobook_to_s
    audiobook = Audiobook.new("Audio String Test", "Author", "Narrator Voice", 90)
    output_string = audiobook.to_s

    assert_instance_of String, output_string
    assert output_string.include?("Audio String Test") # Title
    assert output_string.include?("Narrator Voice")    # Narrator
    assert output_string.include?("minutes")           # Duration info (part of formatted_duration)
  end
end
```
## test_library.rb
```ruby
# test/simple_test_library.rb
require 'minitest/autorun'
require_relative '../library'
require_relative '../book'    
require_relative '../audiobook'

class TestLibrary < Minitest::Test

  # Test 1: Can we add an item and see it listed?
  def test_library_add_and_list
    library = Library.new
    book = Book.new("Library Test Book", "Test Author")

    library.add_book(book) # Or add_item if you renamed it

    assert_equal 1, library.list_items.length
    assert_equal book, library.list_items.first
  end

  # Test 2: Can we find a book by its title?
  def test_library_search
    library = Library.new
    book1 = Book.new("Find Me", "Author One")
    book2 = Book.new("Ignore Me", "Author Two")

    library.add_book(book1)
    library.add_book(book2)

    # Test finding an existing book (case-insensitive check)
    found_book = library.search_by_title("find me")
    assert_equal book1, found_book

    # Test searching for a non-existent book
    not_found_book = library.search_by_title("Does Not Exist")
    assert_nil not_found_book
  end
end
```
