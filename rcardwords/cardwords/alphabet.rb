# File: cardwords/alphabet.rb  -*- ruby -*-
# $Id: alphabet.rb,v 1.1 2003/08/13 22:14:49 t-peters Exp $

require "cardwords/letter.rb"

module Cardwords
  class Alphabet
    def initialize
      super
      @letters = []
      @map = {}
    end
    def push(*letters)
      letters.each{|letter|
	self << letter
      }
      self
    end
    def <<(letter)
      letter.each{|representation|
	@map[representation] = @letters.size
      }
      @letters << letter
      @regex = nil
      self
    end
    def index(something)
      @map[something] || @letters.index(something)
    end
    def match(string)
      @regex ||= /^#{@letters.map{|letter| 
                       letter.map{|rep| rep ? "(?:"+rep+")" : nil}
                     }.flatten.compact.join("|")}/
      indices = []
      while (match = @regex.match(string))
	indices << @map[match[0]]
	raise "wrong" if string == match.post_match
	string = match.post_match
      end
      indices
    end
    def size
      @letters.size
    end
    def [](index)
      @letters.at(index)
    end
  end
end

# Local Variables:
#   compile-command: "cd .. && ruby test.rb"
# End: 
