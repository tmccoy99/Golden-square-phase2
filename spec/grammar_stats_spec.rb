require "grammar_stats"

RSpec.describe GrammarStats do
  
  context "When check is called on grammatical string" do
    it "returns true" do
      gs = GrammarStats.new
      expect(gs.check("Hello.")).to eq true
    end
  end
end