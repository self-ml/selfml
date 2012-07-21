require_relative 'spec_helper'

describe SelfML::Parser do

  subject { SelfML }
  
  let(:basic)    { load_fixture "basic"    }
  let(:comments) { load_fixture "comments" }
  let(:strings)  { load_fixture "strings"  }

  it "parses example correctly" do
    subject.parse(basic[:input]   ).to_s.must_equal basic[:output]
    subject.parse(comments[:input]).to_s.must_equal comments[:output]
    subject.parse(strings[:input] ).to_s.must_equal strings[:output]
  end

end