module SelfML::AST
  
  class Node
    attr_accessor :head , :tail
    
    def initialize( head , tail = [] )
      @head , @tail = head , tail
    end
    
    def serialize( level = 1 )
      tail = @tail.sort.map do |t|
        case t
        when Node
          "\n" + " "*level*4 + (t.serialize level+1)
        when StringNode
          " "+t.serialize
        else
          nil
        end
      end
      
      # puts "head", head, @head.serialize
      # puts "tail", tail
      
      "(" + head.serialize + tail.join("") + ")"
    end
    
    alias :to_s :serialize
    
    def <=> rhs
      case rhs when Node       then  0
               when StringNode then  1
                               else -1 end
    end
    
  end

end