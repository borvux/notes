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
      menu()
      choice = get_user_input()

      case choice
      when "1"
        @library.list_books
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
      end

      puts "Press Enter to continue..."
      gets
    end
  end

  def add_sample_data
    book1 = Book.new("How to learn Math", "Barbar Oaklew")
    audiobook1 = Audiobook.new("The Cat in the Hat", "Dr. Suess", "Monique", 11)

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
  end

  def get_user_input
    print "Choose an option (1-6): "
    gets.chomp
  end

  def add_new_book()
    puts "-- Add New Book --"
    print "Enter Title: "
    title = gets.chomp
    print "Enter Author: "
    author = gets.chomp
    new_book = Book.new(title, author)
    @library.add_book(new_book)
  end

  def add_new_audiobook()
    puts "-- Add New Audiobook --"
    print "Enter Title: "
    title = gets.chomp
    print "Enter Author: "
    author = gets.chomp
    print "Enter Narrator: "
    narrator = gets.chomp
    print "Enter Duration (in minutes): "
    duration = gets.chomp
    new_audiobook = Audiobook.new(title, author, narrator, duration)
    @library.add_book(new_audiobook)
  end

  def checkout()
    puts "-- Check Out Item --"
    print "Enter title to check out: "
    title = gets.chomp
    @library.check_out_book(title)
  end

  def return_book()
    puts "-- Return Item --"
    print "Enter title to return: "
    title = gets.chomp
    @library.return_book(title)
  end
end
