# File: cardwords/test_letter.rb  -*- ruby -*-
# $Id: test_letter.rb,v 1.1 2003/08/13 21:49:20 t-peters Exp $

require "test/unit"
require "cardwords/letter"

module Cardwords
  class Test_Letter < Test::Unit::TestCase
    def test_create_simple_and_retrieve
      letter = Letter.new('a')
      assert_equal('a', letter.code, "ascii letter a")

      letter = Letter.new('Ä') 
      assert_equal('Ä', letter.code, "latin-1 letter A with dieresis")

      letter = Letter.new('Ã¤') 
      assert_equal('Ã¤', letter.code, 'utf-8 letter a with dieresis')

      letter = Letter.new(nil) 
      assert_nil(letter.code, 'nil')
    end
    def test_create_multiple
      letter = Letter.new('a','A')
      assert_equal(2, letter.size)
      assert_equal('a', letter.code)
      assert_equal(['a','A'],letter.map{|x| x})
    end
    def test_match
      letter = Letter.new('a','A', 'xxx')
      assert_equal(nil, letter.match("hallo!"))
      assert_equal('a', letter.match("allo!"))
      assert_equal('A', letter.match("Aloha!"))
      assert_equal('A', letter.match("A"))
      assert_equal(nil, letter.match("XXXX"))
      assert_equal(nil, letter.match("xxXX"))
      assert_equal(nil, letter.match("xx"))
      assert_equal("xxx", letter.match("xxx"))
      assert_equal("xxx", letter.match("xxxq"))
    end
  end
end

# Local Variables:
#   compile-command: "cd .. && ruby test.rb"
# End: 
