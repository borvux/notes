require_relative "book"

class Audiobook < Book
  attr_reader :duration
  attr_reader :narrator

  def initialize(title, author, narrator, duration_minutes, checked_out = false)
    super(title, author, checked_out)
    self.narrator = narrator
    @duration = duration_minutes
  end

  def narrator=(input)
    @narrator = input.titleize
  end

  def formatted_duration
    total_minutes = @duration.to_i
    hours = total_minutes / 60
    minutes = total_minutes % 60

    if hours > 0
      "#{hours} hour#{'s' unless hours == 1}, #{minutes} minute#{'s' unless minutes == 1}"
    else
      "#{minutes} minute#{'s' unless minutes == 1}"
    end
  end

  def to_s
    duration_str = formatted_duration
    "#{title} by #{author}, narrated by #{@narrator} (#{duration_str}) - #{@checked_out ? "Checked out" : "Available"}"
  end
end
