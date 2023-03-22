class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry)
    @diary_entries << entry
  end

  def all
    @diary_entries
  end 

  def count_words
    @diary_entries.map {|entry| entry.count_words }.sum
  end 

  def find_best_entry_for_reading_time(wpm, minutes)
    max_words_can_read = wpm * minutes
    closest_num_words = 0
    best_entry = nil 
    @diary_entries.each do |entry|
      count_words = entry.count_words
      if count_words <= max_words_can_read && count_words > closest_num_words 
        best_entry = entry
        closest_num_words = count_words
      end
    end
    fail "No match found" if best_entry.nil?
    best_entry
  end

end