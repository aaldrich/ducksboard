# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ducksboard/version"

Gem::Specification.new do |s|
  s.name        = 'ducksboard'
  s.version     = Ducksboard::VERSION
  s.summary     = "API wrapper for pushing data to Ducksboard."
  s.description = <<DESCRIPTION
Ruby API wrapper for pushing data to Ducksboard widgets.
DESCRIPTION
  s.authors     = ["Joseph Hsu"]
  s.email       = 'jhsu.x1@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://github.com/jhsu/ducksboard'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 1.8.7'

  s.add_runtime_dependency 'httparty', '~> 0.8', '>= 0.8.1'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest', '~> 4.0', '>= 4.0.0'
  s.add_development_dependency 'webmock', '~> 1.8.11'

  s.post_install_message = <<-DESC
  Quack! (in real-time)"

  ===

  Don't forget to set your ENV variable for DUCKSBOARD_API_KEY

    export DUCKSBOARD_API_KEY='YOURKEY'

  or set it in your script

    Ducksboard.api_key = 'YOURKEY'
DESC

end
