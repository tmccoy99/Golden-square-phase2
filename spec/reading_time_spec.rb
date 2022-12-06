require "reading_time"

RSpec.describe "testing reading_time" do
  context "given a 200 word text" do
    it "returns 1 minute" do
      expect(reading_time("hi " * 200)).to eq "This text will take 1 minute"
    end
  end
end