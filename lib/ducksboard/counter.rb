module Ducksboard
  class Counter < Widget
    def delta
      @data[:delta]
    end

    def delta=(text)
      @data[:value][:delta] = text
    end
  end
end
