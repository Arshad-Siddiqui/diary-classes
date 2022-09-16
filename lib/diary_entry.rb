class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @counter = 0
  end

  attr_reader :title, :contents

  def count_words
    @contents.split.length
  end

  def reading_time(wpm)
    (count_words.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes)
    words_amount = wpm * minutes
    @counter > count_words && @counter = 0
    start = @counter
    stop = words_amount + start
    @counter += words_amount
    @contents.split[start...stop].join(' ')
    # Returns chunk excluding previously read chunk unless it
    # reached the end
  end
end