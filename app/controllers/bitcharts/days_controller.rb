require_dependency "bitcharts/application_controller"

module Bitcharts
  class DaysController < ApplicationController
    before_action :validate_chart
    
    def show
      render json: { 
        labels: date_ranges.map(&:begin).map(&:to_s),
        datasets: chart_scope_pairs.map do |chart_and_scope|
          chart = chart_and_scope.first
          if chart_and_scope.size == 1
            { label: chart.label, data: values(chart) }
          else
            scope = chart_and_scope.second
            { label: chart.scoped_label(scope), data: scoped_values(chart, scope) }
          end
        end
      }
    end

    private

    def values(chart)
      date_ranges.map do |range|
        chart.value_for_date_range(range)
      end
    end

    def scoped_values(chart, scope)
      date_ranges.map do |range|
        chart.scoped_value_for_date_range(range, scope)
      end
    end

    def chart_scope_pairs
      @keys ||= begin
        params[:id].split(' ').map do |key|
          match = key.match(/([[:alnum:]_]+)\[([[:alnum:]_]+)\]/)
          if match
            key = match[1]
            scope = match[2]
            [Bitcharts::BaseChart.for_key(key.to_sym), scope]
          else
            [Bitcharts::BaseChart.for_key(key.to_sym)]
          end
        end
      end
    end

    def date_ranges
      @date_ranges ||= begin
        ranges = []
        begin_date = from - interval
        end_date   = from
        begin
          begin_date += interval
          end_date   += interval
          ranges << (begin_date..end_date)
        end while end_date <= to
        ranges
      end
    end

    def interval
      @interval ||= begin
        p = params[:interval]
        if p.present?
          interval = 0.days
          p.scan(/(\d+) days?/  ).each { |el| interval += el.first.to_i.days   }
          p.scan(/(\d+) weeks?/ ).each { |el| interval += el.first.to_i.weeks  }
          p.scan(/(\d+) months?/).each { |el| interval += el.first.to_i.months }
          p.scan(/(\d+) years?/ ).each { |el| interval += el.first.to_i.years  }
          return interval unless interval < 1.day
        end
        1.day
      end
    end

    def from
      to_date(params[:from], Date.today - 7.days)
    end

    def to
      to_date(params[:to], Date.today)
    end

    def to_date(date_string, fallback)
      if date_string
        begin
          return Date.parse(date_string)
        rescue TypeError => e
        end
      end
      fallback
    end

    def validate_chart
      charts = chart_scope_pairs.map(&:first)
      if charts.empty? || charts.any?(&:nil?)
        raise ActionController::RoutingError.new('Not found')
      end
    end
  end
end
