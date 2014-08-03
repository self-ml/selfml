require_relative 'spec_helper'

describe SelfML::Parser do

  subject { SelfML }

  let(:basic)    { load_fixture "basic"    }
  let(:comments) { load_fixture "comments" }
  let(:strings)  { load_fixture "strings"  }

  it "parses example correctly" do
    assert_equal subject.parse(basic[:input]).to_s, basic[:output]
    assert_equal subject.parse(comments[:input]).to_s, comments[:output]
    assert_equal subject.parse(strings[:input]).to_s, strings[:output]
  end

end
