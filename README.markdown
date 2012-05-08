# Self-ML

This is a ruby library for reading [self-ml](http://chocolatapp.com/blog/self-ml) files.  
It is mostly finished, just needs a good polish.

It will only parse correctly formed files, returning an error otherwise.

## Install

Comming really soon:

    gem install self-ml

## Usage

Read in a .selfml file and pretty print it

```ruby
require 'selfml'

document = SelfML.parse( File.read "file.selfml" ) # SelfML.parse expects a string and returns a SelfML::Document.
puts document.to_s                                 # SelfML::AST::Document.to_s provides the document in pretty printing format.
```

## Documentation

http://rubydoc.info/github/locks/self-ml/master/frames

## How to Contribute

### code digger
1. fork
2. code
3. pull request

### API user
1. test the library with your files
2. submit an issue to the issue tracker

## TO DO

See issue tracker.

## Credits

* locks - ruby implementation
* devyn - helpful support
* alexgordon - clearing up self-ml grammar

[![endorse](http://api.coderwall.com/locks/endorsecount.png)](http://coderwall.com/locks)
[![Build Status](https://secure.travis-ci.org/locks/self-ml.png)](http://travis-ci.org/locks/self-ml)
