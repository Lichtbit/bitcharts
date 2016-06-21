require_dependency "bitcharts/application_controller"

module Bitcharts
  class DaysController < ApplicationController
    def show
      render json: { 
        labels: date_range.map(&:to_s),
        datasets: [
          { label: params[:id], data: values }
        ]
      }
    end

    private

    def values
      date_range.map do |date|
        Day.where(date: date, key: params[:id]).sum(:value)
      end
    end

    def date_range
      from..to
    end

    def from
      begin
        Date.parse(params[:from])
      rescue TypeError => e
        Date.parse('2016-01-01')
      end
    end

    def to
      begin
        Date.parse(params[:to])
      rescue TypeError => e
        Date.parse('2016-01-31')
      end
    end
  end
end
