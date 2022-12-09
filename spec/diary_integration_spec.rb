require "diary"

RSpec.describe "Diary integration testing" do
  context "When contains saved DiaryEntrys" do
    context "When all is called" do
      it "returns the entries in an array" do
        diary = Diary.new
        entry1 = DiaryEntry.new("title1", "contents1")
        entry2 = DiaryEntry.new("title2", "contents2")
        diary.add(entry1)
        expect(diary.all).to eq [entry1]
        diary.add(entry2)
        expect(diary.all).to eq [entry1, entry2]
      end
    end
    
    context "When count_words is called" do
      it "returns combined total of word entries" do
        diary = Diary.new
        entry1 = DiaryEntry.new("title", "lots of contents " * 10)
        entry2 = DiaryEntry.new("title", "some contents " * 8)
        diary.add(entry1)
        expect(diary.count_words).to eq 30
        diary.add(entry2)
        expect(diary.count_words).to eq 46
      end
    end
  end
end