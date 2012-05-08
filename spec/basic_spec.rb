require_relative 'spec_helper'

describe SelfML do

  subject { SelfML }
  let(:fixtures) { load_fixture "basic" }

  describe "Basic" do

    it "parses example correctly" do
      subject.parse(fixtures[:input]).to_s.must_equal fixtures[:output]
    end

  end

end