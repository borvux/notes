# Library App

## Project Goal

Create an interactive CLI application where users can:
* List items in the library.
* Add new books.
* Add new audiobooks.
* Check out items.
* Return items.

## Pseudo-code
  * Require the other three files (`book.rb`, `audiobook.rb`, `library.rb`).
  * Create an instance of your `Library`.
  * Add a few sample `Book` and `Audiobook` objects directly so you have data to test.

### Implement the Core Loop
  * Start an infinite loop
  * Inside the loop:
      * Display a menu of options (1. List, 2. Add Book, ..., 6. Exit).
      * Prompt the user for their choice.
      * Get the user's input.

### User Choices
  * Inside the loop (after getting input):
    * **`'1'` (List):**
        * Tell the library object to display all its items.
    * **`'2'` (Add Book):**
        * Get necessary book details (like title, author) from the user.
        * Create a new `Book` object using those details.
        * Tell the library object to add the new book.
    * **`'3'` (Add Audiobook):**
        * Get necessary audiobook details (like title, author, narrator, duration) from the user.
        * Create a new `Audiobook` object using those details.
        * Tell the library object to add the new audiobook.
    * **`'4'` (Check Out):**
        * Get the title of the item to check out from the user.
        * Tell the library object to check out the item matching that title.
    * **`'5'` (Return):**
        * Get the title of the item to return from the user.
        * Tell the library object to return the item matching that title.
    * **`'6'` (Exit):**
        * Exit the loop (terminate the application).
  * Add a `puts "\nPress Enter to continue..."` and `gets` at the end of the loop to pause execution.
