require_relative 'selfml/engines'
require_relative 'selfml/parser'
require_relative 'selfml/ast'

module SelfML
  
  def self.with(engine)
    transformer = engine.new if engine.instance_of? Class
    
    transformer || Engines::Document.new
  end
  
  def self.parse(s, engine=nil)
    transformer = engine.new if engine.instance_of? Class

    parser        = Parser.new
    transformer ||= Engines::Document.new
    
    tree = parser.parse(s)
    out  = transformer.apply(tree)
  end
  
  def self.to(engine)
    transformer = engine.instance_of? Class ? engine.new : Engines::Document.new

    transformer.apply(tree)
  end

end