require_relative '../spec_helper'
require 'parslet/convenience'

describe SelfML::Parser do

  subject { SelfML::Parser.new }

  describe "String" do

    it "is a verbatim string" do
      lambda { subject.verbatim.parse("verbatim[string") }.must_raise Parslet::ParseFailed
      lambda { subject.verbatim.parse("verbatim]string") }.must_raise Parslet::ParseFailed
      lambda { subject.verbatim.parse("verbatim(string") }.must_raise Parslet::ParseFailed
      lambda { subject.verbatim.parse("verbatim)string") }.must_raise Parslet::ParseFailed
      lambda { subject.verbatim.parse("verbatim{string") }.must_raise Parslet::ParseFailed
      lambda { subject.verbatim.parse("verbatim}string") }.must_raise Parslet::ParseFailed
      lambda { subject.verbatim.parse("verbatim string") }.must_raise Parslet::ParseFailed

      assert subject.verbatim.parse("verbatim")
      assert subject.verbatim.parse("verbatim-string")
    end

    it "is a simple bracket string" do
      assert subject.bracketed.parse("[bracket]")
    end

    it "is a nested bracket string" do
      assert subject.bracketed.parse("[[bracket] [bracket] ]")
    end

    it "is a simple backtick string" do
      assert subject.backtick.parse("`blabla bla bla [] ]`")
    end

    it "is an escaped backtick string" do
      assert subject.backtick.parse("`blabla `` blabla`")
    end

    it "parses all kinds of strings" do
      assert subject.string.parse("verbatim-string")
      assert subject.string.parse("[bracketed string]")
      assert subject.string.parse("`backtick `` string`")
    end

  end

end
