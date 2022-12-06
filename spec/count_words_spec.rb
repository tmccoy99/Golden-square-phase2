require "count_words"

RSpec.describe "Test count_words" do
  context "given string" do
    it "returns the number of words" do
      expect(count_words("hi how are you")).to eq 4
    end
  end
end