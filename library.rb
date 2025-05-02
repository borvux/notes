# library.rb

require_relative "audiobook"

class Library
  attr_reader :books
  
  def initialize(books = [])
    @books = books
  end

  def add_book(book) 
    @books.push(book)
  end

  def check_out_book(title)
    book = self.search_by_title(title)

    if book.nil? 
      raise "Book not found"
    else 
      book.check_out
    end
  end
  
  def return_book(title)
    book = self.search_by_title(title)
      
    if book.nil? 
      raise "Book not found" 
    else 
      book.return
    end
  end

  private

  def search_by_title(title)
    @books.find { |book| book.title == title }
  end
end
