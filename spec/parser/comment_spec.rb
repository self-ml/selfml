require_relative '../spec_helper'

describe SelfML::Parser do

  subject { SelfML::Parser.new }

  describe "Comments" do

    it "parses a line comment" do
      assert subject.line.parse('#')
      assert subject.line.parse('# ')
      assert subject.line.parse('# a')
      assert subject.line.parse("#\n")
      assert subject.line.parse("# \n")
      assert subject.line.parse("#asdfadsf\n")
      assert subject.line.parse("# asdfadsf\n")

      lambda { subject.line.parse("#\na") }.must_raise Parslet::ParseFailed
    end

    it "parses a simple block comment" do
      assert subject.block.parse('{##}')
      assert subject.block.parse('{# #}')
      assert subject.block.parse('{#a#}')
      assert subject.block.parse('{# a #}')
      assert subject.block.parse('{#\n#}')
      assert subject.block.parse('{# \n #}')
      assert subject.block.parse('{# a \n a \n a #}')
    end

    it "parses nested block comments" do
      assert subject.block.parse('{#{##}#}')
      assert subject.block.parse('{#{# #}#}')
      assert subject.block.parse('{#{#a#}#}')
      assert subject.block.parse('{#{# a #}#}')
    end

  end

end
