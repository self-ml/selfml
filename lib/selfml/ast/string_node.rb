module SelfML::AST
  
  # SelfML::AST::StringNode
  #
  class StringNode < String
    
    # @return [String] representation in string format
    def serialize
      return "`#{self.gsub("`","``")}`" if self.count("[") != self.count("]")
      return "[#{self}]"                if self.match(/[#`()\[\]{} ]/)
  
      self
    end
    alias :to_s :serialize
    
    # Orders nodes correctly
    def <=> rhs
      case rhs when StringNode then  0
               when Node       then -1
                               else  1 end
    end
    
  end

end