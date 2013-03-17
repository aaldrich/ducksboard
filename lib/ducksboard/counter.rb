module Ducksboard
  class Counter < Widget
    def delta
      @data[:delta]
    end

    def delta=(val)
      @data[:delta] = val
    end
  end
end
