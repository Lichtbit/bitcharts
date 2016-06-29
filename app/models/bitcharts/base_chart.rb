module Bitcharts
  class BaseChart
    class << self
      def has_key(key)
        chart_types[key] = self
      end

      def chart_types
        @@keys ||= {}
      end

      def for_key(key)
        chart_types[key].try(:new)
      end
    end

    def value_for_range(date_range)
      start_time = date_range.begin.beginning_of_day
      end_time = date_range.end.end_of_day
      value_for_time_range(start_time..end_time)
    end

    def value_for_time_range(time_range)
      raise 'Chart must implement #value_for_range or #value_for_time_range'
    end
  end
end
