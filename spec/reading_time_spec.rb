require "reading_time"

RSpec.describe "testing reading_time" do
  context "given a 200 word text" do
    it "returns 1 minute" do
      expect(reading_time("hi " * 200)).to eq "This text will take 1 minute"
    end
  end
  context "given a different multiple of 200 word text" do
    it "returns time in minutes" do
      expect(reading_time("hi " * 400)).to eq "This text will take 2 minutes"
    end
  end
  context "given a non multiple of 200" do
    it "return in decimal minutes" do
      expect(reading_time("hi " * 300)).to eq "This text will take 1.5 minutes" 
    end
  end
end