# Description

# Install

Comming really soon:

    gem install self-ml

# Usage

Read in a .selfml file and pretty print it

```ruby
require 'selfml'

document = SelfML.parse( File.read "file.selfml" ) # SelfML.parse expects a string and returns a SelfML::Document.
puts document.to_s                                 # SelfML::AST::Document.to_s provides the document in pretty printing format.
```

# Documentation

http://rubydoc.info/github/locks/self-ml/master/frames

# How to Contribute

1. fork
2. code
3. pull request

# Credits

* devyn - helpful support
* alexgordon - clearing up self-ml grammar
