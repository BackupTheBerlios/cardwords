# File: cardwords/letter.rb  -*- ruby -*-
# $Id: letter.rb,v 1.1 2003/08/13 21:49:21 t-peters Exp $

module Cardwords
  class Letter
    include Enumerable
    def code()
      @representations.at(0)
    end
    def initialize(*representations)
      @representations = representations
    end
    def each(&block)
      @representations.each(&block)
    end
    def match(string)
      @representations.each{|representation|
	if (representation == string[0, representation.length])
	  return representation
	end
      }
      nil
    end
    def size
      @representations.size
    end
  end
end

# Local Variables:
#   compile-command: "cd .. && ruby test.rb"
# End: 
