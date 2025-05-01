# test/simple_test_audiobook.rb
require 'minitest/autorun'
require_relative '../audiobook' # Adjust path if needed

class TestAudiobook < Minitest::Test

  # Test 1: Can we create an audiobook with its specific attributes?
  def test_audiobook_creation
    # Use known valid inputs
    audiobook = Audiobook.new("Audio Title", "Audio Author", "Narrator Name", 120)

    assert_instance_of Audiobook, audiobook
    assert_equal "Audio Title", audiobook.title # Inherited
    assert_equal "Narrator Name", audiobook.narrator
    assert_equal 120, audiobook.duration
  end

  # Test 2: Does the string representation include audiobook details?
  def test_audiobook_to_s
    audiobook = Audiobook.new("Audio String Test", "Author", "Narrator Voice", 90)
    output_string = audiobook.to_s

    assert_instance_of String, output_string
    assert output_string.include?("Audio String Test") # Title
    assert output_string.include?("Narrator Voice")    # Narrator
    assert output_string.include?("minutes")           # Duration info (part of formatted_duration)
  end

end
