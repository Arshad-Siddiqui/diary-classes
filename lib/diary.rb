class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry) # entry is instance of DiaryEntry
    @diary_entries.push(entry)
  end

  def all
    # @diary_entries
    diary_string = @diary_entries.map {|entry|
      "#{entry.title}: #{entry.contents}"
    }
    diary_string.join(',\n')
  end

  def count_words
    @word_count = 0
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    @diary_entries.each do |entry|
      @word_count += entry.count_words
    end
    @word_count
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    (count_words.to_f / wpm).ceil

  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    words_to_read = wpm * minutes
    filtered_array = @diary_entries.select {|entry|
      entry.count_words <= words_to_read
    }
    largest_entry = filtered_array.max_by {|entry|
      entry.count_words
    }
    largest_entry
  end
end
