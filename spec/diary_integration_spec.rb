require "diary"

RSpec.describe "Diary integration testing" do
  context "When contains saved DiaryEntrys" do
    entry1 = DiaryEntry.new("title", "contents " * 200)
    entry2 = DiaryEntry.new("title", "more contents " * 200)
    entry3 = DiaryEntry.new("title", "even more contents " * 200)
    
    context "When all is called" do
      it "returns the entries in an array" do
        diary = Diary.new
        diary.add(entry1)
        expect(diary.all).to eq [entry1]
        diary.add(entry2)
        expect(diary.all).to eq [entry1, entry2]
      end
    end
    
    context "When count_words is called" do
      it "returns combined total of words in DiaryEntrys" do
        diary = Diary.new
        diary.add(entry1)
        expect(diary.count_words).to eq 200
        diary.add(entry2)
        expect(diary.count_words).to eq 600
      end
    end
    
    context "When reading_time is called" do
      it "returns combined total of estimated reading times for DiaryEntrys" do
        diary = Diary.new
        diary.add(entry1)
        expect(diary.reading_time(200)).to eq 1
        diary.add(entry2)
        expect(diary.reading_time(200)).to eq 3
        expect(diary.reading_time(300)).to eq 2
      end
    end
    context "When find_best_entry_for_reading_time is called" do
      it "returns longest entry that can be read in available time" do
        diary = Diary.new
        diary.add(entry1)
        expect(diary.find_best_entry_for_reading_time(199, 1)).to eq entry1
        expect(diary.find_best_entry_for_reading_time(200, 1)).to eq entry1
        diary.add(entry2)
        expect(diary.find_best_entry_for_reading_time(400, 1)).to eq entry2
        diary.add(entry3)
         expect(diary.find_best_entry_for_reading_time(600, 1)).to eq entry3
      end
    end
        
  end
end