require 'httparty'
require 'json'

module Ducksboard
  class << self ; attr_accessor :api_key end
  @api_key = ENV['DUCKSBOARD_API_KEY']

  def self.auth
    {:username => api_key, :password => "x"}
  end
end

require 'ducksboard/api'
require 'ducksboard/response'
require 'ducksboard/http_push'

require 'ducksboard/dashboard'
require 'ducksboard/widget'

