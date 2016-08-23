module Bitcharts
  class ScopedChart < BaseChart
    def scoped_value_for_date_range(date_range, scope)
      scoped_value(date_range, scope)
    end

    def scoped_value(date_range, scope)
      raise 'Chart must implement #scoped_value(date_range, scope)'
    end
  end
end
