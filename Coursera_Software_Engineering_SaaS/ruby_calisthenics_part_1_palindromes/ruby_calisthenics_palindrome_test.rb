require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'ruby_calisthenics_palindrome'

class RubyCalisthenicsPalindromeTest < Test::Unit::TestCase
  
  def test_palindrome_returns_true_for_palindromes
    string1 = "A man, a plan, a canal -- Panama"
    string2 = "Madam, I'm Adam!"
    test = RubyCalisthenics.new
    assert_equal test.palindrome?(string1), true
    assert_equal test.palindrome?(string2), true
    
  end
  
  def test_palindrome_returns_false_for_non_palindromes
    string1 = "Abracadabra"
    string2 = "mooo"
    test = RubyCalisthenics.new
    assert_equal test.palindrome?(string1), false
    assert_equal test.palindrome?(string2), false
  end
  
  def test_count_words_return_hash_whose_keys_are_words_and_values_are_number_of_times_each_word_appears
    test = RubyCalisthenics.new
    assert_equal test.count_words("A man, a plan, a canal -- Panama"), {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
    assert_equal test.count_words("Doo bee doo bee doo"), {'doo' => 3, 'bee' => 2}
  end
    
end



