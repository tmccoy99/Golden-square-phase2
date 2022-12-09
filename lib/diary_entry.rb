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
   (self.count_words/(wpm.to_f)).round
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
