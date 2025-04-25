# audiobook.rb

require_relative "book"

class Audiobook < Book
  attr_reader :narrator, :duration

  def initialize(title, author, narrator, duration, checked_out = false)
    super(title, author, checked_out)
    self.narrator = narrator
    @duration = duration
  end

  def narrator=(input)
    raise "title must be a string" unless input.is_a? String
    @narrator = input.titleize
  end

  def formatted_duration
    total_minutes = @duration.to_i
    hours = total_minutes / 60
    minutes = total_minutes % 60

    if hours < 1
      "#{minutes} minutes"
    else
      "#{hours} hours and #{minutes} minutes"
    end
  end

  def to_s 
     "#{title} by #{author}, Narrator: #{narrator}, Duration: #{formatted_duration} - #{@checked_out ? "Checked out" : "Available"}"
  end
end
