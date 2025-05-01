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
