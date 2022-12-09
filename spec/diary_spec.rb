require "diary"

RSpec.describe Diary do
  
  diary = Diary.new
  
  context "for instance with no saved entries" do
    it "returns empty array when all called" do
      expect(diary.all).to eq []
    end
    it "returns 0 when count_words called" do
      expect(diary.count_words).to eq 0
    end
    it "returns 0 when reading_time called" do
      expect(diary.reading_time(200)).to eq 0
    end
    it "raises error when find_best_entry_for_reading_time called" do
      expect{ diary.find_best_entry_for_reading_time(0, 0) }.to raise_error "Error, no entries in diary"
    end 
  end
end