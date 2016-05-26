module FunWithStrings
  def palindrome?
    # your code here
    letters = self.downcase.scan(/\w/)
    return letters == letters.reverse

  end
  def count_words
    wordCount = {}
    self.downcase.scan(/\b[\w]*\b/).each do |word|
      next if  word.empty?
      if wordCount[word] == nil || wordCount[word] == ''
        wordCount[word] = 1
      else
        wordCount[word] = (wordCount[word]+1)
      end
    end
    return wordCount
  end


  def anagram_groups
    # your code here
    groupWord = {}
    self.downcase.scan(/\b[\w]*\b/).each do |word|
      key=word.split('').sort.join
      groupWord[key] ||= []
      groupWord[key] << word
    end
    return groupWord.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end


