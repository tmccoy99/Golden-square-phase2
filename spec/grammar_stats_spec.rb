require "grammar_stats"

RSpec.describe GrammarStats do
  
  context "When check is called on grammatical string" do
    it "returns true" do
      gs = GrammarStats.new
      expect(gs.check("Hello.")).to eq true
    end
  end
  
  context "When check is called on a non grammatical string" do
    it "returns false" do
      gs = GrammarStats.new
      expect(gs.check("hello")).to eq false
      expect(gs.check("Hello")).to eq false
      expect(gs.check("hello.")).to eq false
    end
  end
end