module Bitcharts
  class Scope
    def initialize(scope)
      @scope = scope
    end

    def to_s
      @scope
    end

    def to_i
      @scope.to_i
    end

    def to_id
      to_i == 0 ? nil : to_i
    end
  end
end