require 'set'
class WordChainer
  attr_reader :dictionary

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
    @dictionary = Set.new(@dictionary)
  end
# src => duck
  def run(src, target)
    @current_words = [src]
    @all_seen_words = { src => nil }
    until @current_words.empty? || @all_seen_words.key?(target)
      explore_current_words
    end
    p build_path(target)
  end



def build_path(target)
  path = []
  current_word = target
    until current_word.nil?
      path << current_word
      current_word = @all_seen_words[current_word]
    end

    path.reverse
end

  private
    def explore_current_words
      new_current_words = []
      @current_words.each do |word|
        adjacent_words(word).each do |adjacent_word|
          next if @all_seen_words.key?(adjacent_word)
          new_current_words << adjacent_word
          @all_seen_words[adjacent_word] = word
        end
      end
      @current_words = new_current_words
    end

    def adjacent_words(word)
      adjacent_words = []
      word.each_char.with_index do |old_letter, i|
        ('a'..'z').each do |new_letter|
         next if old_letter == new_letter
         new_word = word.dup
         new_word[i] = new_letter
         adjacent_words << new_word if dictionary.include?(new_word)
        end
      end
      adjacent_words
    end
end

chain_chainer = WordChainer.new('dictionary.txt')
chain_chainer.run("duck", "ruby")
