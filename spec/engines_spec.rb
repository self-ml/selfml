require_relative 'spec_helper'
require 'selfml/engines/hash'

describe SelfML do

  let(:document) { SelfML::Parser.new.parse("(grandparent (parent child1 child2))") }

  describe "Engines" do

    describe "Hash" do
      subject      { SelfML::Engines::Hash.new }
      # let(:engine) { SelfML::Engines::Hash }

      it "parses correctly" do
        subject.apply(document)
      end

      it "outputs correctly" do
        output = {:document=>[{:grandparent=>[{:parent=>["child1", "child2"]}]}]}

        assert_equal subject.apply(document), output
      end
    end

  end

end
