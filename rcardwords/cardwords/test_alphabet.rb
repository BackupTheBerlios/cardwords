# File: cardwords/test_alphabet.rb  -*- ruby -*-
# $Id: test_alphabet.rb,v 1.1 2003/08/13 22:16:40 t-peters Exp $

require "test/unit"
require "cardwords/alphabet"

module Cardwords
  class Test_Alphabet < Test::Unit::TestCase
    def setup
      @alphabet = Alphabet.new
      @alphabet.push(Letter.new(nil),
		     Letter.new("A","a"),
		     Letter.new("Ä","ä"),
		     Letter.new("B","b"),
		     Letter.new("C","c"),
		     Letter.new("D","d"),
		     Letter.new("E","e"),
		     Letter.new("F","f"),
		     Letter.new("G","g"),
		     Letter.new("LL","ll"),
		     Letter.new("L","l"))
      
    end
    def test_create
      a = Alphabet.new
      assert_equal(0, a.size)
    end
    def test_fill
      a = Alphabet.new
      a.push(Letter.new(nil),Letter.new('A'),Letter.new('Ä'))
      assert_equal(nil, a[0].code)
      assert_equal('A', a[1].code)
      assert_equal('Ä', a[2].code)
    end
    def test_index
      a = Alphabet.new
      a.push(Letter.new(nil),Letter.new('a','A'),Letter.new('Ä'))
      assert_equal(0, a.index(nil))
      assert_equal(1, a.index('A'))
      assert_equal(1, a.index('a'))
      assert_equal(2, a.index('Ä'))
    end
    def test_match
      assert_equal([1,7,7,6], @alphabet.match("Affe"))
      assert_equal([1,1,10],   @alphabet.match("Aal"))
      assert_equal([1,9,6],   @alphabet.match("alle"))
    end
  end
end

# Local Variables:
#   compile-command: "cd .. && ruby test.rb"
# End: 
