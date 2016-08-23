module Bitcharts
  class BaseChart
    class << self
      def has_key(key)
        chart_types[key] = self
        define_method(:key) { key }
      end

      def chart_types
        @@keys ||= {}
      end

      def for_key(key)
        chart_types[key].try(:new)
      end
    end

    def label
      key
    end

    def value_for_date_range(date_range)
      value(date_range)
    end

    def value(date_range)
      raise 'Chart must implement #value(date_range)'
    end
  end
end
