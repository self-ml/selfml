require 'rubygems'

require 'require_relative'
require 'awesome_print'
require 'differ'

require_relative 'lib/selfml.rb'

### Testing Facilities
def load_tests(name)
  [
    File.read("spec/fixtures/#{name}.selfml") ,
    File.read("spec/fixtures/output.#{name}.selfml")
  ]
end

t = <<-HERE
([don jon]
    (music
        iPod
        (life)
        iTunes)
    (computers
        iMac
        [Mac mini])
    (phones
        iPhone)
    (dishwashers))
HERE


basic_in    , basic_out    = load_tests("basic")
comments_in , comments_out = load_tests("comments")
strings_in  , strings_out  = load_tests("strings")

puts SelfML.parse(t).to_s
puts "---"
puts SelfML.parse(basic_in).to_s    == basic_out
puts SelfML.parse(strings_in).to_s  == strings_out
puts SelfML.parse(comments_in).to_s == comments_out

#puts Differ.diff_by_line( SelfML.parse(basic_in).to_s  , basic_out)
#puts Differ.diff_by_line( SelfML.to_sml( SelfML.parse(string_in)   ), string_out)
#puts Differ.diff_by_line( SelfML.to_sml( SelfML.parse(comments_in) ), comments_out)