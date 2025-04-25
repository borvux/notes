require_relative "book"
require_relative "audiobook"
require_relative "library"

monique_library = Library.new

book1 = Book.new("How to learn Math", "Barbar Oaklew")
audiobook1 = Audiobook.new("The Cat in the Hat", "Dr. Suess", "Monique", 11)

monique_library.add_book(book1)
monique_library.add_book(audiobook1)

while true do
  
  puts "========== Library Menu =========="
  puts "1. List all items"
  puts "2. Add a new Book"
  puts "3. Add a new Audiobook"
  puts "4. Check out an item"
  puts "5. Return an item"
  puts "6. Exit"
  print "Choose an option (1-6): "

  choice = gets.chomp

  case choice
  when '1'
    monique_library.list_books
  when '2'
    puts "-- Add New Book --"
    print "Enter Title: "
    title = gets.chomp
    print "Enter Author: "
    author = gets.chomp

    puts "Press Enter to continue..."
    gets
  when '3'

  when '4'

  when '5'

  when '6'
    break
  end
end
