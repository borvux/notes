# book.rb

# Book: Each book has a title, an author, and an availability status (whether the book is checked out).
# availability :boolean

require "active_support/all"

class Book
  attr_accessor :title, :author, :checked_out

  def initialize(title, author, checked_out = false)
    self.title = title
    self.author = author
    @checked_out = checked_out
  end

  def title=(input)
    raise "title must be a string" unless input.is_a? String
    @title = input.titleize
  end

  def author=(input)
    raise "Author must contain words only" unless input.is_a?(String)
    @author = input.titleize
  end

  def check_out
    if @checked_out == true
      puts "'#{title}'  is already checked out."
    else
      @checked_out = true
      puts "'#{title}' checked out successfully."
    end
  end

  def return
    if @checked_out == false
      puts "'#{title}' is already checked in."
    else
      @checked_out = false
      puts "'#{title}' returned successfully."
    end
  end

  def to_s
    "#{title} by #{author} - #{@checked_out ? "Checked out" : "Available"}"
  end
end

