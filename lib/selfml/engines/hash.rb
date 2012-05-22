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
  end
  
  class JSON < Hash
    rule(:document => sequence(:d)) { require 'json'; Array(d).to_json }
  end
  
end