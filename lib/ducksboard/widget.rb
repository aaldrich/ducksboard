module Ducksboard
  class Widget
    include HTTParty
    include API
    format :json
    type "app", "/api"

    attr_accessor :label

    # Get all of the current widgets.
    def self.all
      response = get("/widgets", :basic_auth => Ducksboard.auth)
      response.parsed_response["data"].map {|data|
        new(data["widget"]["id"])
      }
    end

    def initialize(label)
      @label = @id = label
    end

    # Push data to resource endpoint.
    def <<(values)
      pusher.push(values)
    end

    protected

    def pusher
      @pusher ||= HTTPPush.new(label)
    end
  end
end
