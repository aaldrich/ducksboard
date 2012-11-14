module Ducksboard
  class Widget
    include HTTParty
    include API
    format :json
    type "app", "/api"

    attr_accessor :label, :id

    # Get all of the current widgets.
    def self.all
      response = get("/widgets", :basic_auth => Ducksboard.auth)
      response.parsed_response["data"].map {|data|
        new(data["widget"])
      }
    end

    def self.find(id)
      new({"id" => id})
    end

    def initialize(attributes={})
      @label = @id = attributes["id"]
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
