module SelfML::AST

  # SelfML::AST::Comment
  #
  class Comment < String
    
    # @return [nil] Comments do not show up
    def serialize; nil; end
    alias :to_s :serialize

  end

end