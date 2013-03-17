module Ducksboard
  class Counter < Widget
    def delta
      @data[:delta]
    end

    def delta=(text=nil)
      @data[:delta] = delta.to_s
    end
  end
end
