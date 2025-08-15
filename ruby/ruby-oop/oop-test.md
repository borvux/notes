# minitest

## book.rb
```ruby
require "minitest/autorun"
require "active_support/all"
require_relative "../lib/book"

class TestBook < Minitest::Test
  def setup
    @book = Book.new("the old man and the sea", "ernest hemingway")
  end

  def test_initialize_with_title_and_author
    assert_equal "The Old Man And The Sea", @book.title
    assert_equal "Ernest Hemingway", @book.author
    assert_equal false, @book.checked_out
  end

  def test_initialize_with_checked_out_status
    book_checked_out = Book.new("moby dick", "herman melville", true)
    assert_equal true, book_checked_out.checked_out
  end

  def test_title_setter_titleizes_input
    @book.title = "a farewell to arms"
    assert_equal "A Farewell To Arms", @book.title
  end

  def test_title_setter_raises_error_for_blank_input
    assert_raises RuntimeError do
      @book.title = ""
    end
    assert_raises RuntimeError do
      @book.title = nil
    end
  end

  def test_author_setter_titleizes_input
    @book.author = "f. scott fitzgerald"
    assert_equal "F. Scott Fitzgerald", @book.author
  end

  def test_author_setter_raises_error_for_blank_input
    assert_raises RuntimeError do
      @book.author = ""
    end
    assert_raises RuntimeError do
      @book.author = nil
    end
  end

  def test_check_out_available_book
    assert_equal true, @book.check_out
    assert_equal true, @book.checked_out
  end

  def test_check_out_raises_error_if_already_checked_out
    @book.check_out # First checkout
    exception = assert_raises RuntimeError do
      @book.check_out # Second checkout
    end
    assert_equal "This book is already checked out", exception.message
  end

  def test_return_checked_out_book
    @book.check_out
    assert_equal true, @book.return
    assert_equal false, @book.checked_out
  end

  def test_return_raises_error_if_not_checked_out
    exception = assert_raises RuntimeError do
      @book.return # Not checked out
    end
    assert_equal "This book is not checked out", exception.message
  end

  def test_to_s_formats_correctly_when_available
    expected_string = "The Old Man And The Sea by Ernest Hemingway - Available"
    assert_equal expected_string, @book.to_s
  end

  def test_to_s_formats_correctly_when_checked_out
    @book.check_out
    expected_string = "The Old Man And The Sea by Ernest Hemingway - Checked out"
    assert_equal expected_string, @book.to_s
  end
end
```
## audiobook.rb
```ruby
require "minitest/autorun"
require "active_support/all"
require_relative "../lib/audiobook" # Assumes audiobook.rb requires book.rb

class TestAudiobook < Minitest::Test
  def setup
    @audiobook = Audiobook.new("the hobbit", "j.r.r. tolkien", "andy serkis", 720) # 12 hours
  end

  def test_audiobook_is_a_kind_of_book
    assert_kind_of Book, @audiobook
  end

  def test_initialize_with_all_attributes
    assert_equal "The Hobbit", @audiobook.title
    assert_equal "J.r.r. Tolkien", @audiobook.author # Note: ActiveSupport titleize might handle initials this way
    assert_equal "Andy Serkis", @audiobook.narrator
    assert_equal 720, @audiobook.duration
    assert_equal false, @audiobook.checked_out
  end

  def test_initialize_with_checked_out_status
    audiobook_checked_out = Audiobook.new("dune", "frank herbert", "scott brick", 1260, true)
    assert_equal true, audiobook_checked_out.checked_out
  end

  def test_narrator_setter_titleizes_input
    @audiobook.narrator = "stephen fry"
    assert_equal "Stephen Fry", @audiobook.narrator
  end

  def test_narrator_setter_raises_error_for_blank_input
    assert_raises RuntimeError do
      @audiobook.narrator = ""
    end
  end

  def test_duration_setter_converts_to_integer
    @audiobook.duration = "300"
    assert_equal 300, @audiobook.duration
  end

  def test_duration_setter_raises_error_for_non_positive_input
    assert_raises RuntimeError do
      @audiobook.duration = 0
    end
    assert_raises RuntimeError do
      @audiobook.duration = -10
    end
    assert_raises RuntimeError do
      @audiobook.duration = "invalid" # to_i converts this to 0
    end
  end

  def test_formatted_duration_less_than_one_hour
    @audiobook.duration = 45
    assert_equal "45 minutes", @audiobook.formatted_duration
  end

  def test_formatted_duration_exactly_one_hour
    @audiobook.duration = 60
    assert_equal "1 hours and 0 minutes", @audiobook.formatted_duration
  end

  def test_formatted_duration_more_than_one_hour
    @audiobook.duration = 75
    assert_equal "1 hours and 15 minutes", @audiobook.formatted_duration
  end

  def test_formatted_duration_multiple_hours
    @audiobook.duration = 130 # 2 hours and 10 minutes
    assert_equal "2 hours and 10 minutes", @audiobook.formatted_duration
  end

  def test_to_s_formats_correctly_for_audiobook_available
    expected = "The Hobbit by J.r.r. Tolkien, Narrator: Andy Serkis, Duration: 12 hours and 0 minutes - Available"
    assert_equal expected, @audiobook.to_s
  end

  def test_to_s_formats_correctly_for_audiobook_checked_out
    @audiobook.check_out
    expected = "The Hobbit by J.r.r. Tolkien, Narrator: Andy Serkis, Duration: 12 hours and 0 minutes - Checked out"
    assert_equal expected, @audiobook.to_s
  end

  def test_audiobook_can_be_checked_out_and_returned
    assert_equal false, @audiobook.checked_out
    @audiobook.check_out
    assert_equal true, @audiobook.checked_out
    @audiobook.return
    assert_equal false, @audiobook.checked_out
  end
end
```
## library.rb
```ruby
require "minitest/autorun"
require "active_support/all"
require_relative "../lib/library"
require_relative "../lib/book"
require_relative "../lib/audiobook"

class TestLibrary < Minitest::Test
  def setup
    @library = Library.new
    @book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald")
    @audiobook1 = Audiobook.new("1984", "George Orwell", "Simon Prebble", 660)
  end

  def test_can_initialize_empty_library
    assert_empty @library.books
  end

  def test_can_initialize_library_with_books
    library_with_books = Library.new([@book1, @audiobook1])
    assert_equal 2, library_with_books.books.count
    assert_includes library_with_books.books, @book1
  end

  def test_add_book_adds_book_to_collection
    @library.add_book(@book1)
    assert_includes @library.books, @book1
    assert_equal 1, @library.books.count
  end

  def test_add_book_adds_audiobook_to_collection
    @library.add_book(@audiobook1)
    assert_includes @library.books, @audiobook1
    assert_equal 1, @library.books.count
  end

  def test_search_by_title_finds_existing_book
    @library.add_book(@book1)
    @library.add_book(@audiobook1)
    found_book = @library.send(:search_by_title, "The Great Gatsby") # Test private method
    assert_equal @book1, found_book
  end

  def test_search_by_title_returns_nil_for_nonexistent_book
    @library.add_book(@book1)
    found_book = @library.send(:search_by_title, "Nonexistent Book")
    assert_nil found_book
  end

  def test_check_out_book_successfully_checks_out_available_book
    @library.add_book(@book1)
    @library.check_out_book("The Great Gatsby")
    assert_equal true, @book1.checked_out
  end

  def test_check_out_book_raises_error_if_book_not_found
    exception = assert_raises RuntimeError do
      @library.check_out_book("Unknown Book")
    end
    assert_equal "Book not found", exception.message
  end

  def test_check_out_book_propagates_error_if_book_already_checked_out
    @library.add_book(@book1)
    @book1.check_out # Check out directly
    exception = assert_raises RuntimeError do
      @library.check_out_book("The Great Gatsby")
    end
    assert_equal "This book is already checked out", exception.message
  end

  def test_return_book_successfully_returns_checked_out_book
    @library.add_book(@book1)
    @book1.check_out
    @library.return_book("The Great Gatsby")
    assert_equal false, @book1.checked_out
  end

  def test_return_book_raises_error_if_book_not_found
    exception = assert_raises RuntimeError do
      @library.return_book("Unknown Book")
    end
    assert_equal "Book not found", exception.message
  end

  def test_return_book_propagates_error_if_book_not_checked_out
    @library.add_book(@book1) # Book is available, not checked out
    exception = assert_raises RuntimeError do
      @library.return_book("The Great Gatsby")
    end
    assert_equal "This book is not checked out", exception.message
  end
end
```
## library_cli.rb
```ruby
require "minitest/autorun"
require "stringio" # For capturing puts
require "active_support/all"
require_relative "../lib/library_cli"
require_relative "../lib/library"
require_relative "../lib/book"
require_relative "../lib/audiobook"

class TestLibraryCli < Minitest::Test
  def setup
    @cli = LibraryCli.new
    @library = @cli.instance_variable_get(:@library) # Access internal library for setup
  end

  # Helper to simulate user input
  def simulate_input(*inputs)
    io = StringIO.new
    inputs.each { |input| io.puts(input) }
    io.rewind
    $stdin = io
    yield
  ensure
    $stdin = STDIN # Restore original $stdin
  end

  # Helper to capture output
  def capture_cli_output
    original_stdout = $stdout
    $stdout = captured_output = StringIO.new
    yield
    captured_output.string
  ensure
    $stdout = original_stdout
  end

  def test_initialize_creates_a_library_instance
    assert_instance_of Library, @library
  end

  def test_add_sample_data_populates_library
    @cli.add_sample_data
    assert_equal 2, @library.books.count
    assert @library.books.any? { |b| b.title == "How To Learn Math" }
    assert @library.books.any? { |b| b.title == "The Cat In The Hat" && b.is_a?(Audiobook) }
  end

  def test_list_all_items_displays_books
    book1 = Book.new("Test Book 1", "Author 1")
    @library.add_book(book1)

    output = capture_cli_output do
      @cli.list_all_items
    end

    assert_match(/--- Library Catalog ---/, output)
    assert_match(/1. Test Book 1 by Author 1 - Available/, output)
    assert_match(/---------------------/, output)
  end

  def test_list_all_items_empty_library
    output = capture_cli_output do
      @cli.list_all_items
    end
    assert_match(/--- Library Catalog ---/, output)
    assert_match(/---------------------/, output)
    refute_match(/\d\./, output) # Should not find any numbered items
  end

  def test_add_new_book_successfully
    output = ""
    simulate_input("New Title", "New Author") do
      output = capture_cli_output { @cli.add_new_book }
    end

    assert_equal 1, @library.books.count
    added_book = @library.books.first
    assert_equal "New Title", added_book.title
    assert_equal "New Author", added_book.author
    assert_match(/New Title is sucessfully added/, output)
  end

  def test_add_new_book_handles_error_on_blank_title
    output = ""
    simulate_input("", "New Author") do # Blank title
      output = capture_cli_output { @cli.add_new_book }
    end

    assert_empty @library.books # No book should be added
    assert_match(/Error: Title cannot be empty/, output)
  end

  def test_add_new_audiobook_successfully
    output = ""
    simulate_input("Audio Title", "Audio Author", "Audio Narrator", "120") do
      output = capture_cli_output { @cli.add_new_audiobook }
    end

    assert_equal 1, @library.books.count
    added_audiobook = @library.books.first
    assert_instance_of Audiobook, added_audiobook
    assert_equal "Audio Title", added_audiobook.title
    assert_equal "Audio Author", added_audiobook.author
    assert_equal "Audio Narrator", added_audiobook.narrator
    assert_equal 120, added_audiobook.duration
    assert_match(/Audio Title is successfully added/, output)
  end

  def test_add_new_audiobook_handles_error_on_invalid_duration
    output = ""
    simulate_input("Audio Title", "Audio Author", "Audio Narrator", "0") do # Invalid duration
      output = capture_cli_output { @cli.add_new_audiobook }
    end

    assert_empty @library.books
    assert_match(/Error: Duration must be greater than 0/, output)
  end

  def test_checkout_successfully
    book_to_checkout = Book.new("Checkoutable Book", "Some Author")
    @library.add_book(book_to_checkout)
    output = ""

    simulate_input("Checkoutable Book") do
      output = capture_cli_output { @cli.checkout }
    end

    assert book_to_checkout.checked_out
    assert_match(/Checkoutable Book is now checked out/, output)
  end

  def test_checkout_handles_book_not_found
    output = ""
    simulate_input("Nonexistent Book") do
      output = capture_cli_output { @cli.checkout }
    end
    assert_match(/Error: Book not found/, output)
  end

  def test_return_book_successfully
    book_to_return = Book.new("Returnable Book", "An Author")
    @library.add_book(book_to_return)
    book_to_return.check_out
    output = ""

    simulate_input("Returnable Book") do
      output = capture_cli_output { @cli.return_book }
    end

    refute book_to_return.checked_out
    assert_match(/Returnable Book is successfully returned/, output)
  end

  def test_return_book_handles_book_not_checked_out
    book_not_checked_out = Book.new("Available Book", "Writer")
    @library.add_book(book_not_checked_out)
    output = ""

    simulate_input("Available Book") do
      output = capture_cli_output { @cli.return_book }
    end
    assert_match(/Error: This book is not checked out/, output)
  end

  # Rudimentary test for the run loop - just ensures it can exit
  def test_run_loop_can_exit
    # This test is tricky without more advanced mocking of the loop itself.
    # We'll just test that providing '6' (Exit) breaks the loop.
    # The actual test for `run` would be more of an integration test.
    # For now, we can assume that if the menu option '6' works, the loop can exit.
    output = ""
    simulate_input("6") do # Choose 'Exit'
      output = capture_cli_output { @cli.run }
    end
    # No explicit assertion needed other than it doesn't loop forever.
    # We could check that menu() was called at least once.
    assert_match(/========== Library Menu ==========/, output) # Menu was shown
  end
end
```
