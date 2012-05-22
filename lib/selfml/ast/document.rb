module SelfML::AST
  
  class Document < Array
  
    def to_s
      a = self.map(&:serialize).reject {|n| n.nil? }
      a.join("\n\n") + "\n"
    end
  
  end
  
end