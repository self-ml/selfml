module SelfML::Engines

  class Array < Parslet::Transform
    rule(:verbatim => simple(:s)) { String(s).to_sym }
    rule(:string   => simple(:s)) { s.to_sym }
    
    rule(:list => subtree(:l)) do
      # (tail = Array(l[:tail]).empty? ? [ String(l[:head]).to_sym , Array(l[:tail]) ]
      [String(l[:head].to_sym)].tap do |ary|
        tail = Array(l[:tail])
        
        ary.concat tail unless tail.empty?
      end
    end
    
    rule(:document => subtree(:d)) { Array(d) }
  end

end