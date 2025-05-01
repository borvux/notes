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
