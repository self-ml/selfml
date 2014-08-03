require_relative 'spec_helper'

describe SelfML do

  subject { SelfML }
  let(:fixtures) { load_fixture "strings" }

  describe "Strings" do

    it "is a verbatim string" do
    end

    it "is a bracketed string" do
    end

    it "is a backtick string" do
    end

    it "parses example correctly" do
      assert_equal subject.parse(fixtures[:input]).to_s, fixtures[:output]
    end

  end

end
