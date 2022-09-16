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
    if @counter > count_words then @counter = 0 end
    start = @counter
    stop = words_amount + start
    @counter += words_amount
    @contents.split[start...stop].join(' ')
  end
end