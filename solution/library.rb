class Library
  def initialize(books = [])
    @books = books
  end

  def add_book(book)
    @books.push(book)
  end
  
  def list_items
    @books
  end

  def search_by_title(title)
    @books.find { |book| book.title.downcase == title.downcase }
  end
end
