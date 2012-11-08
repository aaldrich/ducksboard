module Ducksboard
  class HTTPPush
    include HTTParty
    include API
    format :json
    type "push", "/values"

    attr_reader :label

    def initialize(label)
      @label = label
    end

    # Send data to the endpoint.
    def push(data)
      response = self.class.post(path, :body => data.to_json, :basic_auth => Ducksboard.auth)
      Response.new(response)
    end

    # Delete all data for the given label
    def delete
    end

    protected

    # Path for endpoint.
    def path
      "/#{@label}"
    end
  end
end
