module SelfML::AST
  
  class Document < Array

    def to_s
      a = self.map(&:serialize).reject {|n| n.nil? }
      b = a.sort
      
      a.join("\n\n") + "\n"
    end

  end

  class Node
    attr_accessor :head , :tail
    
    def initialize( head , tail = [] )
      @head , @tail = head , tail
    end
    
    def serialize level=1
      tail = @tail.sort.map do |t|
        case t
        when Node
          "\n" + " "*level*4 + "#{t.serialize level+1}"
        when StringNode
          " #{t.serialize}"
        else
          nil
        end
      end
      
      "(#{head.serialize}#{tail})"
    end
    
    alias :to_s :serialize
    
    def <=> rhs
      case rhs
      when Node
        0
      when StringNode
        1
      else
        -1
      end
    end

  end
  
  class StringNode < String
    
    def serialize
      return "`#{self.gsub("`","``")}`" if self.count("[") != self.count("]")
      return "[#{self}]"                if self.match(/[#`()\[\]{} ]/)

      self
    end
    
    alias :to_s :serialize
    
    def <=> rhs
      case rhs
      when StringNode
        0
      when Node
        -1
      else
        1
      end
    end
    
  end
  
  class Comment < String
    def serialize; nil; end
    
    alias :to_s :serialize
  end

end