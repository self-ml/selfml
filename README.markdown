# Self-ML

[![Gem Version](https://badge.fury.io/rb/selfml.svg)](http://badge.fury.io/rb/selfml)
[![Build Status](https://secure.travis-ci.org/locks/self-ml.png)](http://travis-ci.org/locks/self-ml)
[![Code Climate](https://codeclimate.com/github/self-ml/selfml/badges/gpa.svg)](https://codeclimate.com/github/self-ml/selfml)
[![Inline docs](http://inch-ci.org/github/self-ml/selfml.svg?branch=master)](http://inch-ci.org/github/self-ml/selfml)
[![Gemnasium Build Status](https://gemnasium.com/self-ml/selfml.png)](https://gemnasium.com/self-ml/selfml)

This is a ruby library for reading [self-ml](http://chocolatapp.com/blog/self-ml) files.
It is mostly finished, just needs a good polish.

It will only parse correctly formed files, returning an error otherwise.

## Install

```ruby
    gem install self-ml
```

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
* alexgordon - creating self-ml and clearing up the grammer
* devyn - helpful support
* atamis - alternative ruby implementation, inspiration
* kschiess - creating parslet and schooling me on how to use it
