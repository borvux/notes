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
