class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title ; @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split.length
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
    @contents.split.length/(wpm.to_f).round
    
  end

  def reading_chunk(wpm, minutes)
    @saved_idx ||= 0
    max_words = wpm * minutes
    words_left = @contents.split[@saved_idx..-1]
    @saved_idx = @saved_idx + max_words
    @saved_idx = 0 if @saved_idx >= self.count_words
    return words_left.join(" ") if max_words >= words_left.length
    words_left[0...max_words].join(" ")
    
  end
end

# `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.