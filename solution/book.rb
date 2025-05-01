require "active_support/all"

class Book
  attr_accessor :title, :author, :checked_out

  def initialize(title, author, checked_out = false)
    self.title = title
    self.author = author
    @checked_out = checked_out
  end

  def title=(input)
    raise "Title cannot be empty." if input.strip.empty?
    @title = input.titleize
  end

  def author=(input)
    raise "Author cannot be empty." if input.strip.empty?
    @author = input.titleize
  end

  def check_out
    return false if @checked_out
    @checked_out = true
    true
  end

  def return_item
    return false unless @checked_out
    @checked_out = false
    true
  end

  def to_s
    "#{title} by #{author} - #{@checked_out ? "Checked out" : "Available"}"
  end
end
