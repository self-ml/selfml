require 'selfml'

def load_fixture name
  {
    :input  => File.read("spec/fixtures/#{name}.selfml"),
    :output => File.read("spec/fixtures/output.#{name}.selfml")
  }
end