# book.rb

require "active_support/all"

class Book
  attr_accessor :title, :author, :checked_out

  def initialize(title, author, checked_out = false)
    self.title = title
    self.author = author
    @checked_out = checked_out
  end

  def title=(input)
    raise "Title cannot be empty" if input.blank?
    @title = input.titleize
  end

  def author=(input)
    raise "Author cannot be empty" if input.blank?
    @author = input.titleize
  end

  def check_out
    raise "This book is already checked out" if @checked_out
    @checked_out = true
    return true
  end

  def return
    raise "This book is not checked out" unless @checked_out
    @checked_out = false
    return true
  end

  def to_s
    "#{title} by #{author} - #{@checked_out ? "Checked out" : "Available"}"
  end
end
