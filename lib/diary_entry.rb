class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title ; @contents = contents
    @contents_words = @contents.split
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents_words.length
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
    self.count_words/(wpm.to_f).round
    
  end

  def reading_chunk(wpm, minutes)
    @saved_idx ||= 0
    max_words = wpm * minutes
    end_idx = @saved_idx + max_words
    chunk = @contents_words[@saved_idx...end_idx].join(" ")
    @saved_idx = end_idx >= self.count_words ? 0 : end_idx
    chunk
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