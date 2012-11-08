require 'httparty'

module Ducksboard
  class << self ; attr_accessor :api_key end
  @api_key = ENV['DUCKSBOARD_API_KEY']
end

require 'ducksboard/api'
require 'ducksboard/response'

require 'ducksboard/dashboard'
require 'ducksboard/http_push'

require 'ducksboard/widget'

# require 'ducksboard/box'
# require 'ducksboard/counter'
# require 'ducksboard/gauge'
# require 'ducksboard/graph'
# require 'ducksboard/image'
# require 'ducksboard/pin'
# require 'ducksboard/timeline'
# require 'ducksboard/leaderboard'
