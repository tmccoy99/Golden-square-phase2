def make_snippet(string)
    words = string.split
    return string if words.length <= 5
    words[0..4].join(' ') + "..." 
end