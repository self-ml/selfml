module SelfML::AST

  # SelfML::AST::Document
  #
  class Document < Array
  
    # Serialize
    def to_s
      a = self.map(&:serialize).reject {|n| n.nil? }
      a.join("\n\n") + "\n"
    end
  
  end
  
end