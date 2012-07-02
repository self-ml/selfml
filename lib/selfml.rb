require 'bundler/setup'

module SelfML; end

require 'selfml/engines'
require 'selfml/parser'
require 'selfml/ast'

module SelfML

  def self.parse(s, engine=nil)
    transformer = engine.new if engine.instance_of? Class

    parser        = Parser.new
    transformer ||= Engines::Document.new
    
    tree = parser.parse(s)
    out  = transformer.apply(tree)
  end

end
