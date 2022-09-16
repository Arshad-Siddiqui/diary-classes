class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @counter = 0
    # @counter is an integer used to keep track of the words read.
    # @contents and @title are strings
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split.length
  end

  def reading_time(wpm)
    # Calculates length of time used to read @contents in minutes
    # based on words per minute and then rounded up.
    (count_words.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes)
    words_amount = wpm * minutes
    # Calculates the amount of words the user can read.
    # p "words_amount: #{words_amount}"
    # p "@counter before size check: #{@counter}"
    if @counter > count_words then @counter = 0 end
    # p "@counter after size check: #{@counter}"
    # Resets @counter when it is larger than length of @contents.
    # Allows looping back to the beginning once the last chunk of
    # @contents is returned.
    start = @counter
    # p "start: #{start}"
    # @counter is being changed but the pre-change version of it is part of the return statement
    # so it is being saved in 'start' for it to be returned.
    stop = words_amount + start
    # p "stop: #{stop}"
    # Marks last index for the word array being returned.
    @counter += words_amount
    # p "Counter after addition of words_amount: #{@counter}"
    # This modification is important so the next time this method is called
    # we get a different start position.
    @contents.split[start...stop].join(' ')
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end

# my_entry = DiaryEntry.new('monday', 'one space two space three space four space five space six space seven space eight space nine space')

# p my_entry.reading_chunk(2, 2)
# p my_entry.reading_chunk(2, 2)
# p my_entry.reading_chunk(2, 2)