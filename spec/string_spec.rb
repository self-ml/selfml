require 'bundler/setup'

require 'minitest'
require 'minitest/autorun'

require 'selfml'

def load_fixture name
  {
    :input  => File.read("fixtures/#{name}.selfml"),
    :output => File.read("fixtures/output/#{name}.selfml")
  }
end

describe SelfML do
  before(:each) do
    @parser  = Parser.new
    @fixture = load_fixture "strings"
  end

  describe "Strings" do
    
    it "parses example correctly" do
      @parser.parse(@fixture['input']).must_equal @fixture['output']
    end
    
  end
  
end