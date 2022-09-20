class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry) # entry is instance of DiaryEntry
    @diary_entries.push(entry)
  end

  def all
    diary_string = @diary_entries.map {|entry|
      "#{entry.title}: #{entry.contents}"
    }
    diary_string.join(",\n")
  end

  def count_words
    @word_count = 0
    # Returns the number of words in all diary entries
    @diary_entries.each do |entry|
      @word_count += entry.count_words
    end
    @word_count
  end

  def reading_time(wpm)
    (count_words.to_f / wpm).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # Finds largest entry that reader can complete within given time
    # Factoring in reading speeed.

    # Filters any entries that are larger than what the reader can read
    # in allotted time.
    words_to_read = wpm * minutes
    filtered_array = @diary_entries.select {|entry|
      entry.count_words <= words_to_read
    }

    # Gets largest entry from filtered list based on amount of contents.
    largest_entry = filtered_array.max_by {|entry|
      entry.count_words
    }

    # Returns largest object
    "#{largest_entry.title}: #{largest_entry.contents}"
  end
end
