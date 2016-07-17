require_dependency "bitcharts/application_controller"

module Bitcharts
  class DaysController < ApplicationController
    before_action :validate_chart
    
    def show
      render json: { 
        labels: date_range.map(&:to_s),
        datasets: [
          { label: key, data: values }
        ]
      }
    end

    private

    def values
      date_range.map do |date|
        chart.value_for_date_range(date..date)
      end
    end

    def key
      @key ||= params[:id] ? params[:id].to_sym : nil
    end

    def chart
      @chart ||= Bitcharts::BaseChart.for_key(key)
    end

    def date_range
      from..to
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
      if chart.nil?
        raise ActionController::RoutingError.new('Not found')
      end
    end
  end
end
