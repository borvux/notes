require "active_support/all"

class Book
  attr_reader :title, :author
  attr_accessor :checked_out

  def initialize(title, author, checked_out = false)
    self.title = title
    self.author = author
    @checked_out = checked_out
  end

  def title=(input)
    raise "Title must be a non-empty string" unless input.is_a?(String) && !input.strip.empty?
    @title = input.strip.titleize
  end

  def author=(input)
    raise "Author must be a non-empty string" unless input.is_a?(String) && !input.strip.empty?
    @author = input.strip.titleize
  end

  def check_out
    if @checked_out
      puts "'#{title}' is already checked out."
      false
    else
      @checked_out = true
      puts "'#{title}' checked out successfully."
      true
    end
  end

  def return
    if !@checked_out
      puts "'#{title}' is already checked in."
      false
    else
      @checked_out = false
      puts "'#{title}' returned successfully."
      true
    end
  end

  def to_s
    "#{title} by #{author} - #{@checked_out ? "Checked out" : "Available"}"
  end
end
