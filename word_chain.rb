require 'set'
class WordChainer
  attr_reader :dictionary
  def initialize(dictionary_file)
    @dictionary = File.readlines(dictionary_file).map(&:chomp)
  end
# src => duck
  def run(src, target)
    @current_words = [src]
    @all_seen_words = { src => nil }

    until @current_words.empty?
      explore_current_words
    end
  end







  private

    def explore_current_words
      new_current_words = []
      @current_words.each do |word|
        adjacent_words(word).each do |adjacent_word|
          next if @all_seen_words.include?(adjacent_word)
          new_current_words << adjacent_word
          @all_seen_words[adjacent_word] = word
        end
      end
      new_current_words.each { |word| puts "#{word} came from, #{@all_seen_words[word]}" }
      @current_words = new_current_words # => all the adjacent words are now inside currrent_words
    end

    def adjacent_words(word)
      dictionary.select do |current_words|
         one_letter_off(current_words, word)
      end
    end

    def one_letter_off(word1, word2)
      return false if word1 == word2 || word1.size != word2.size
      diffrent = 0;
      chars_seen = Hash.new(0)
      word1.chars.each { |chr| chars_seen[chr] += 1 }
      word2.chars.each {|chr| diffrent += 1 if word2.count(chr) != chars_seen[chr] }
      diffrent == 1
    end
end


g = WordChainer.new('dictionary.txt')
g.run("duck", "ruby")
