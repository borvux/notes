require_relative "book"

class Audiobook < Book
  attr_reader :narrator, :duration

  DURATION_REGEX = /\A[1-9]\d*\z/

  def initialize(title, author, narrator, duration, checked_out = false)
    super(title, author, checked_out)
    self.narrator = narrator
    self.duration = duration
  end

  def narrator=(input)
    raise "Narrator cannot be empty." if input.strip.empty?
    @narrator = input.titleize
  end

  def duration=(input)
    string_input = input.to_s
    raise "Duration cannot be empty." if string_input.strip.empty?
    raise "Duration must be a valid integer." unless string_input.match?(DURATION_REGEX)
    @duration = input.to_i
  end

  def formatted_duration
    total_minutes = @duration
    hours = total_minutes / 60
    minutes = total_minutes % 60

    if hours > 0
      "#{hours} hour#{"s" unless hours == 1}, #{minutes} minute#{"s" unless minutes == 1}"
    else
      "#{minutes} minute#{"s" unless minutes == 1}"
    end
  end

  def to_s
    duration_str = formatted_duration
    "#{title} by #{author}, narrated by #{@narrator} (#{duration_str}) - #{@checked_out ? "Checked out" : "Available"}"
  end
end
