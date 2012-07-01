require 'bundler/setup'

module SelfML; end

require_relative 'selfml/engines'
require_relative 'selfml/parser'
require_relative 'selfml/ast'

module SelfML

  def self.parse(s, engine=nil)
    transformer = engine.new if engine.instance_of? Class

    parser        = Parser.new
    transformer ||= Engines::Document.new
    
    tree = parser.parse(s)
    out  = transformer.apply(tree)
  end

end
