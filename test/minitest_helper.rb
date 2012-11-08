require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'minitest/spec'
require 'minitest/autorun'
require 'webmock/minitest'
# Usage: stub_request(:any, "www.example.com")
require 'json'

require 'ducksboard'
