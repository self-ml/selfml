module SelfML::AST
  
  class StringNode < String
    
    def serialize
      return "`#{self.gsub("`","``")}`" if self.count("[") != self.count("]")
      return "[#{self}]"                if self.match(/[#`()\[\]{} ]/)
  
      self
    end
    
    alias :to_s :serialize
    
    def <=> rhs
      case rhs when StringNode then  0
               when Node       then -1
                               else  1 end
    end
    
  end

end