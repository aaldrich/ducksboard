module Ducksboard
  class Response
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def code
      response.code
    end

    def success?
      code >= 200 && code < 300
    end
  end
end
