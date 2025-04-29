# library.rb

require_relative "audiobook"

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

  def list_books
    puts "--- Library Catalog ---"
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book}"
    end
    puts "---------------------"
  end

  private

  def search_by_title(title)
    @books.find { |book| book.title == title }
  end
end
