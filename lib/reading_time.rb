load 'count_words.rb'

def reading_time(text)
  count = count_words(text)
  time_in_mins = count / 200
  return  "This text will take #{time_in_mins} minutes"  if time_in_mins > 1 
  "This text will take #{time_in_mins} minute"
end