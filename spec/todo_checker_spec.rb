require "todo_checker"

RSpec.describe "Testing todo_checker" do
  context "does not contain #TODO" do
    it "fails" do
      expect(todo_checker("hi")).to eq false
    end
  end

  context "does contain #TODO" do
    it "passes" do
      expect(todo_checker("hihihhihihihih#TODO hjahahahah")).to eq true
    end
  end
end