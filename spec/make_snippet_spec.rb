require 'make_snippet'

RSpec.describe 'Testing make_snippet' do
    context 'String of 5 words or less' do
        it 'return itself' do
            result = make_snippet('Five words or less')
            expect(result).to eq 'Five words or less'
        end
    end
    context 'String of more than 5 words' do
        it 'returns first five words + ...' do
            result = make_snippet('This is five words or more')
            expect(result).to eq 'This is five words or...'
        end
    end
end