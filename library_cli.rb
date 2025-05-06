# library_cli.rb

require_relative "book"
require_relative "audiobook"
require_relative "library"

class LibraryCli
  def initialize
    @library = Library.new
  end

  def run
    while true
      system("clear")
      menu()
      choice = get_user_input("Choose an option (1-6): ")

      case choice
      when "1"
        list_all_items()
      when "2"
        add_new_book()
      when "3"
        add_new_audiobook()
      when "4"
        checkout()
      when "5"
        return_book()
      when "6"
        break
      else
        puts "Invalid option"
      end

      puts "Press Enter to continue..."
      gets
    end
  end

  def add_sample_data
    book1 = Book.new("How To Learn Math", "Barbara Oakley")
    audiobook1 = Audiobook.new("The Cat In The Hat", "Dr. Seuss", "Kelsey Grammer", 11)
    @library.add_book(book1)
    @library.add_book(audiobook1)
  end

  private

  def menu
    puts "========== Library Menu =========="
    puts "1. List all items"
    puts "2. Add a new Book"
    puts "3. Add a new Audiobook"
    puts "4. Check out an item"
    puts "5. Return an item"
    puts "6. Exit"
    puts "=================================="
  end

  def get_user_input(prompt)
    print "#{prompt}"
    gets.chomp
  end

  def adding(prompt)
    puts "-- Add New #{prompt} --"
    title = get_user_input("Enter Title: ")
    author = get_user_input("Enter Author: ")
    return [title, author]
  end

  def add_new_book()
    title, author = adding("book")
    new_book = Book.new(title, author)
    @library.add_book(new_book)
    puts "#{title} is sucessfully added"
  rescue => e
    puts "Error: #{e}"
  end

  def add_new_audiobook()
    title, author = adding("AudioBook")
    narrator = get_user_input("Enter Narrator: ")
    duration = get_user_input("Enter Duration (in minutes): ")
    new_audiobook = Audiobook.new(title, author, narrator, duration)
    @library.add_book(new_audiobook)
    puts "#{title} is successfully added"
  rescue => e
    puts "Error: #{e}"
  end

  def checkout()
    puts "-- Check Out Item --"
    title = get_user_input("Enter title to check out: ")
    @library.check_out_book(title)
    puts "#{title} is now checked out"
  rescue => e
    puts "Error: #{e}"
  end

  def return_book()
    puts "-- Return Item --"
    title = get_user_input("Enter title to return: ")
    @library.return_book(title)
    puts "#{title} is successfully returned"
  rescue => e
    puts "Error: #{e}"
  end

  def list_all_items
    puts "--- Library Catalog ---"
    @library.books.each_with_index do |book, index|
      puts "#{index + 1}. #{book}"
    end
    puts "---------------------"
  end
end
