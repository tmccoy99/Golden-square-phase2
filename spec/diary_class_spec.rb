require "diary_class"

RSpec.describe DiaryEntry do
  entry = DiaryEntry.new("Tuesday", "Today was great")
  context "When provided title and contents" do
    it "Can return them" do
      expect(entry.title).to eq "Tuesday"
      expect(entry.contents).to eq "Today was great"
    end
  end
  
  context "When count_words called" do
    it "returns number of words in contents as int" do
      expect(entry.count_words).to eq 3
    end
  end
  
  entry2 = DiaryEntry.new("HI", "hi " * 1000)
  context "When has contents and reading_time is called" do
    it "Returns the estimated reading time of contents" do
      expect(entry2.reading_time(200)).to eq 5
    end
  end
  
  context "reading_chunk is called with wpm*reading_time >= contents.length" do
    it "returns context" do
      expect(entry2.reading_chunk(1000, 1)).to eq entry2.contents
    end
  end
  
  context "reading_chunk is called with wpm*reading_time < contents.length" do
    it "returns first wpm*reading_time words of contents" do
      expect(entry2.reading_chunk(500, 1)).to eq ("hi " * 500).chop
    end
  end
  
end