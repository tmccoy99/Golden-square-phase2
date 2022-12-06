load 'count_words.rb'

def reading_time(text)
  count = count_words(text)
  time_in_mins = count / 200.to_f
  time_in_mins = time_in_mins.to_i if time_in_mins.to_s[-2..-1] == ".0"
  return  "This text will take #{time_in_mins} minutes" unless time_in_mins == 1 
  "This text will take #{time_in_mins} minute"
end