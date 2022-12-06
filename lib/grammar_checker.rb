def grammar_checker(text)
    first_letter = text[0]
    last_letter = text[-1]
    fail("Doesn't have a capital at the start") unless first_letter.upcase == first_letter
    fail("Doesn't have punctuation at the end.") unless ['?','!','.'].include?(last_letter)
    'This has passed'
end