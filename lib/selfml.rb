require 'bundler/setup'

# SelfML main module
#
# @author Ricardo Mendes
module SelfML; end

require 'selfml/engines'
require 'selfml/parser'
require 'selfml/ast'


module SelfML

  # Returns a SelfML document
  #
  # @param [String] source the content to be parsed
  # @param [SelfML::Engines::Document, SelfML::Engines::Array, SelfML::Engines::Hash] engine transformation engine pretended.
  # @return [SelfML::Document] parsed document
  def self.parse(source, engine=Engines::Document.new)
    transformer = engine.new if engine.instance_of? Class

    parser        = Parser.new
    transformer ||= Engines::Document.new
    
    tree = parser.parse(source)
    out  = transformer.apply(tree)
  end

end
