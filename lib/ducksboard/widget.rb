module Ducksboard
  class Widget
    attr_accessor :label

    def initialize(label)
      @label = label
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
