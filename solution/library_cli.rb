require_relative "book"
require_relative "audiobook"
require_relative "library"

class LibraryCli
  def initialize
    @library = Library.new
  end

  def run
    while true
      display_menu
      choice = prompt("Choose an option (1-6):")

      case choice
      when "1"
        display_all_items
      when "2"
        add_new_book
      when "3"
        add_new_audiobook
      when "4"
        checkout_item
      when "5"
        return_item
      when "6"
        puts "Exiting Library Application. Goodbye!"
        break
      else
        puts "Invalid option. Please choose a number between 1 and 6."
      end

      print "\nPress Enter to continue..."
      gets
      system("clear") || system("cls")
    end
  end

  def add_sample_data
    book1 = Book.new("How To Learn Math", "Barbara Oakley")
    audiobook1 = Audiobook.new("The Cat In The Hat", "Dr. Seuss", "Kelsey Grammer", 11)
    @library.add_book(book1)
    @library.add_book(audiobook1)
  end

  private

  def prompt(message)
    print "#{message} "
    gets.chomp.strip
  end

  def display_menu
    puts "\n========== Library Menu =========="
    puts "1. List all items"
    puts "2. Add a new Book"
    puts "3. Add a new Audiobook"
    puts "4. Check out an item"
    puts "5. Return an item"
    puts "6. Exit"
    puts "=================================="
  end

  def add_new_book
    puts "\n-- Add New Book --"
    title = prompt("Enter Title: ")
    author = prompt("Enter Author: ")
    begin
      new_book = Book.new(title, author)
      @library.add_book(new_book)
      puts "Book '#{new_book.title}' by #{new_book.author} added successfully."
    rescue RuntimeError => e
      puts "Error adding book: #{e.message}"
      puts "Book was not added."
    end
  end

  def add_new_audiobook
    puts "\n-- Add New Audiobook --"
    title = prompt("Enter Title: ")
    author = prompt("Enter Author: ")
    narrator = prompt("Enter Narrator: ")
    duration_str = prompt("Enter Duration (in minutes): ")

    begin
      new_audiobook = Audiobook.new(title, author, narrator, duration_str)
      @library.add_book(new_audiobook)
      puts "Audiobook '#{new_audiobook.title}' narrated by #{new_audiobook.narrator} added successfully."
    rescue RuntimeError => e
      puts "Error adding audiobook: #{e.message}"
      puts "Audiobook was not added."
    end
  end

  def checkout_item
    puts "\n-- Check Out Item --"
    title = prompt("Enter title to check out:")

    book_to_checkout = @library.search_by_title(title)

    if book_to_checkout.nil?
      puts "Book not found with title matching '#{title}'."
    else
      if book_to_checkout.check_out
        puts "'#{book_to_checkout.title}' checked out successfully."
      else
        puts "'#{book_to_checkout.title}' is already checked out."
      end
    end
  end

  def return_item
    puts "\n-- Return Item --"
    title = prompt("Enter title to return:")

    book_to_return = @library.search_by_title(title)

    if book_to_return.nil?
      puts "Book not found with title matching '#{title}'."
    else
      if book_to_return.return_item
        puts "'#{book_to_return.title}' returned successfully."
      else
        puts "'#{book_to_return.title}' is already checked in (available)."
      end
    end
  end

  def display_all_items
    puts "\n--- Library Catalog ---"
    items = @library.list_items
    if items.empty?
      puts "The library is currently empty."
    else
      items.each_with_index do |item, index|
        puts "#{index + 1}. #{item}"
      end
    end
    puts "---------------------"
  end
end
