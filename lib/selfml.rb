require 'rubygems'
require 'require_relative'

module SelfML; end

['parser','ast','transformer'].each do |file|
  require_relative "selfml/#{file}"
end

module SelfML
  
  def self.parse(s, engine=nil)
    transformer = engine.new if engine.instance_of? Class

    parser        = Parser.new
    transformer ||= Transformer.new
    
    tree = parser.parse(s)
    out  = transformer.apply(tree)
  end

end