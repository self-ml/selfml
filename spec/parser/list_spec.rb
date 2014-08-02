require_relative '../spec_helper'

describe SelfML::Parser do

  subject { SelfML::Parser.new }

  describe "List" do
    let(:empty_list)  { "()"                   }
    let(:head_list)   { "(head)"               }
    let(:basic_list)  { "(head rest1 rest2)"   }
    let(:nested_list) { "(head1 (head2 tail))" }

    it "cannot be empty" do
      lambda { subject.list.parse(empty_list) }.must_raise Parslet::ParseFailed
    end

    it "has head" do
      assert subject.parse("(head)")
    end

    it "has head and tail" do
      assert subject.parse("(head tail1 tail2)")
    end

    it "has nested tail only" do
      lambda { subject.list.parse("((head) head)") }.must_raise Parslet::ParseFailed

      assert subject.parse("(head (head tail))")
      assert subject.parse("(head (head (head)))")
    end

  end

end
