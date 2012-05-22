require_relative 'hash'

module SelfML::Engines

  class JSON < SelfML::Engines::Hash
    rule(:document => sequence(:d)) { Array(d).to_json }
  end

end