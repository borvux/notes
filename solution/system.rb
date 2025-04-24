require_relative 'book'
require_relative 'audiobook'
require_relative 'library'

def get_input(prompt)
  print "#{prompt}: "
  gets.chomp
end

my_library = Library.new
my_library.add_book(Book.new("The Hobbit", "J.R.R. Tolkien"))
my_library.add_book(Audiobook.new("Project Hail Mary", "Andy Weir", "Ray Porter", 960))

while true do
  puts "\n========== Library Menu =========="
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
    my_library.list_items

  when '2'
    puts "\n-- Add New Book --"
    title = get_input("Enter Title")
    author = get_input("Enter Author")
    new_book = Book.new(title, author)
    my_library.add_book(new_book)

  when '3'
    puts "\n-- Add New Audiobook --"
    title = get_input("Enter Title")
    author = get_input("Enter Author")
    narrator = get_input("Enter Narrator")
    duration_str = get_input("Enter Duration (in minutes)")
    duration = duration_str.to_i
    new_audiobook = Audiobook.new(title, author, narrator, duration)
    my_library.add_book(new_audiobook)

  when '4'
    puts "\n-- Check Out Item --"
    title = get_input("Enter title to check out")
    my_library.check_out_book(title)

  when '5'
    puts "\n-- Return Item --"
    title = get_input("Enter title to return")
    my_library.return_book(title)

  when '6'
    break
  end

  puts "\nPress Enter to continue..."
  gets
end
