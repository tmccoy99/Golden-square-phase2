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
  end
end