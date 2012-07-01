module SelfML::Engines
  
  class Hash < Parslet::Transform
    rule(:document => sequence(:d)) { Array(d) }
    rule(:list => subtree(:l)) do
      head = String(l[:head]).to_sym
      tail = Array(l[:tail])
      
      { head => tail }
    end
    
    rule(:string   => simple(:s)) { String(s) }
    rule(:verbatim => simple(:s)) { String(s) }
    
    rule(:brackets => sequence(:b)) { "[#{b.reduce(:+)}]" }
    
    rule(:text => simple(:t)) { String(t) }
  end
  
end