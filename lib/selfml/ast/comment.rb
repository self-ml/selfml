module SelfML::AST

  class Comment < String
    def serialize; nil; end
    
    alias :to_s :serialize
  end

end