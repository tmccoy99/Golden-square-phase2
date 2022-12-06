require "grammar_checker"

RSpec.describe "Testing grammar checker" do
    context 'When starts with lowercase letter' do
        it 'fails' do
            expect{ grammar_checker('hello') }.to raise_error "Doesn't have a capital at the start"
        end 
    end
    context "When doesn't finish with appropriate punctuation" do
        it 'fails' do
            expect{ grammar_checker('Hello') }.to raise_error "Doesn't have punctuation at the end."
        end
    end
    context 'Starts with capital and ends with punctuation' do
        it 'Passes' do
            expect(grammar_checker('Hello!')).to eq 'This has passed' 
        end
    end
end