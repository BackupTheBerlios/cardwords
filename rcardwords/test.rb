#!/usr/bin/env ruby
# standard test runner
# loads all files matching test_*.rb in the test/ directory to ruby

require "test/unit"
require "find"

def load_tests
  top_dir = File.dirname(caller[0])
  Find.find(top_dir){|path|
    if (FileTest.file?(path) && /[\/\\]test_.+\.rb$/.match(path))
      require path
    end
  }
end

load_tests
