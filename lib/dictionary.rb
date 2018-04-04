def substrings(word, dictionary)
  # create new array
  word = word.downcase.split(" ")
  hashing = Hash.new(0)
  # passing key to hash
  dictionary.each do |dc|
    word.each do |wd|
      # push key dc to the hash
      hashing[dc] += 1 if wd.include? dc # counter the hash if dictionary has the same word (note : this is ruby's style)
    end
  end
  hashing
end

dictionary = [
  "below",
  "down",
  "go",
  "going",
  "horn",
  "how",
  "howdy",
  "it",
  "i",
  "low",
  "own",
  "part",
  "partner",
  "sit"
]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)