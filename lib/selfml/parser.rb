require 'parslet'

class Parslet::Parser
  rule(:space)  { match('\s').repeat(1) }
  rule(:space?) { space.maybe }

  rule(:word)   { match('\w').repeat }
  rule(:word?)  { word.maybe }  
end # monkey patching in a couple of helpers

class SelfML::Parser < Parslet::Parser
  root(:top)
  rule(:top)  do
    (space? >> node >> space?).repeat.as(:document)
  end
  
  rule(:node) { comment.as(:comment) | list.as(:list) | string.as(:string)  }
  
  # String
  rule(:string)    { backtick.as(:backticks) | bracketed.as(:brackets) | verbatim.as(:verbatim) }
  rule(:backtick) do
    str('`') >> (
      str('``').as(:ticks) | match('``|[^`]').as(:text)
    ).repeat >> str('`')
  end
  rule(:bracketed) do
  	str('[') >> (
  	  bracketed.as(:nested) | match('[^\]]').as(:text)
    ).repeat >> str(']')
  end
  rule(:verbatim)  { str("#").absnt? >> match['^\[\](){}\s'].repeat(1) }

  # List
  rule(:tail) do
    (node >> space?).repeat
  end
  rule(:list) do
  	str('(') >> space? >> 
  	  comment.as(:comment).maybe >> space? >>
  	  string.as(:head)           >> space? >>
  	  tail.as(:tail)             >> space? >>
    space?   >> str(')')
  end
  
  # Comment
  rule(:comment) { line.as(:line) | block.as(:block) }
  rule(:line)    { str('#') >> match['^\\n'].repeat.as(:text) >> (str("\n") | any.absnt?) }
  rule(:block) do
    str('{#') >> (
      block.as(:block) |  match['^#}'].as(:text)
    ).repeat >> str('#}')
  end

end