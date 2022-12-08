require "diary_class"

RSpec.describe DiaryEntry do
  context "When provided title and contents" do
    it "Can return them" do
      entry = DiaryEntry.new("Tuesday", "Today was great")
      expect(entry.title).to eq "Tuesday"
      expect(entry.contents).to eq "Today was great"
    end
  end
  
  context "When count_words called" do
    it "returns number of words in contents as int" do
      entry = DiaryEntry.new("Tuesday", "Today was great")
      expect(entry.count_words).to eq 3
    end
  end
  
  context "When has contents and reading_time is called" do
    it "Returns the estimated reading time of contents" do
      entry = DiaryEntry.new("HI", "hi " * 1000)
      expect(entry.reading_time(200)).to eq 5
    end
  end
  
  context "reading_chunk is called with wpm*reading_time >= contents.length" do
    it "returns context" do
      entry = DiaryEntry.new("HI", "hi " * 1000)
      expect(entry.reading_chunk(1000, 1)).to eq entry.contents.chop
    end
  end
  
  context "reading_chunk is called with wpm*reading_time < contents.length" do
    it "returns first wpm*reading_time words of contents" do
      entry = DiaryEntry.new("HI", "hi " * 1000)
      expect(entry.reading_chunk(500, 1)).to eq ("hi " * 500).chop
    end
  end
  
  context "reading_chunk called multiple times" do
    it "sequentially returns chunks of contents" do
      testing_contents = ("Hello " * 5) + ("there " * 5) + ("chap " * 3)
      entry = DiaryEntry.new("Greeting", testing_contents)
      expect(entry.reading_chunk(5, 1)).to eq ("Hello " * 5).chop
      expect(entry.reading_chunk(5, 1)).to eq ("there " * 5).chop
      expect(entry.reading_chunk(5, 1)).to eq ("chap " * 3).chop
    end
  end
  
  context "reading_chunk called again after finishing contents" do
    it "will start returning contents from beginning do" do
      entry = DiaryEntry.new("News", "The country isn't doing well")
      entry.reading_chunk(5, 1)
      expect(entry.reading_chunk(2, 2)).to eq "The country isn't doing"
    end
  end
end