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
      Date.parse('2016-01-01')..Date.parse('2016-01-31')
    end
  end
end
