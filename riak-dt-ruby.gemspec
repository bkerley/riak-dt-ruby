# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'riak-dt-ruby/version'

Gem::Specification.new do |gem|
  gem.name          = "riak-dt-ruby"
  gem.version       = Riak::Dt::Ruby::VERSION
  gem.authors       = ["Bryce Kerley"]
  gem.email         = ["bkerley@brycekerley.net"]
  gem.description   = %q{riak_dt client library}
  gem.summary       = %q{A client library for Riak CRDT support, as seen in riak_dt.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday', ['~> 0.8.4']
end
