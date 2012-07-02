class RubyCalisthenics
  
#Part 1 - A: returns_true_for_palindromes and returns_false_for_non_palindromes
  def palindrome?(string)
    @string = string.gsub(/\W/,"").downcase
    @string == @string.reverse
  end

#Part 1 - B: return_hash_whose_keys_are_words_and_values_are_number_of_times_each_word_appears
  def count_words(string)
    raw_array = words_to_array(string)
    unique_words = remove_duplicate_words(raw_array)
    word_counts =  get_word_counts(unique_words, raw_array)
    combine_to_hash(unique_words, word_counts)
  end
  
  def words_to_array string
    string.downcase.scan(/\w+/) # string to array of words
  end
  
  def remove_duplicate_words array
    array.uniq # identify unique words in string
  end
  
  def get_word_counts array1, array2
    array1.collect { |word| array2.count(word) } #count number of times each word appears
  end
  
  def combine_to_hash array1, array2
    Hash[*array1.zip(array2).flatten] #populate hash keys with words and values with number of times each word appears   #return a hash
  end
  
  
end



