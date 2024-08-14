def substrings(string, dictionary)
  arr = string.downcase.split
  result_hash = Hash.new

  arr.each do |string_word|
    dictionary.each do |dictionary_word|
      if string_word.include?(dictionary_word) == true
        unless result_hash.key?(dictionary_word) == true
          result_hash[dictionary_word] = 1
         else
          result_hash[dictionary_word] += 1
        end
      end
    end
  end
  p result_hash
end

dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dict)
substrings("below", dict)