require 'selfml/ast'

module SelfML::Engines

  # SelfML::Engines::Document
  #
  # The main one.
  # The real deal.
  class Document < Parslet::Transform
    include SelfML::AST
  
    rule(:document => sequence(:doc)) { SelfML::AST::Document.new(doc) }
    rule(:list => subtree(:l)) do
      Node.new(
        StringNode.new(l[:head]) , Array(l[:tail])
      )
    end
  
    # Comments
    rule(:comment =>     simple(:s)) { Comment.new(s)             }
    rule(:block   =>   simple(:blk)) { Comment.new(blk)           }
    rule(:block   => sequence(:blk)) { Comment.new(blk.reduce :+) }
    rule(:line    =>    simple(:ln)) { Comment.new(ln)            }
    
    # Strings
    rule(:string    => simple(:s)) { StringNode.new(s) }
    rule(:verbatim  => simple(:s)) { StringNode.new(s) }
    
    rule(:backticks => sequence(:s)) { StringNode.new(s.reduce :+) }
    rule(:ticks     =>   simple(:s)) { "`" }
    
    rule(:brackets => sequence(:b)) { StringNode.new(b.reduce :+) }
    rule(:nested   =>   simple(:n)) { StringNode.new(n) }
    rule(:nested   => sequence(:n)) { "[" + StringNode.new(n.reduce :+) + "]" }
    
    rule(:text => simple(:t)) { StringNode.new(t) }
  end

end