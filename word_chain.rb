require 'set'
class WordChainer
  attr_reader :dictionary
  def initialize(dictionary_file)
    @dictionary = Set.new(File.readlines(dictionary_file).map(&:chomp))
  end

end

g =  WordChainer.new('dictionary.txt')
p g.dictionary
