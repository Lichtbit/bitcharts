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
  end
end
