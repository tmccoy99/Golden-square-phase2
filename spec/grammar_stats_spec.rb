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
  
  context "When percentage_good is called before any check calls" do
    it "returns 100" do
      gs = GrammarStats.new
      expect(gs.percentage_good).to eq 100
    end
  end
  
  context "When percentage_good is called after check calls" do
    it "returns rounded integer percentage of check calls that returned true" do
      gs = GrammarStats.new
      gs.check("Hello")
      expect(gs.percentage_good).to eq 0
      gs.check("Banana.")
      expect(gs.percentage_good).to eq 50
      gs.check("You're a wizard Harry.")
      expect(gs.percentage_good).to eq 67
    end
  end
end

