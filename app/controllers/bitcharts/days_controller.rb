require_dependency "bitcharts/application_controller"

module Bitcharts
  class DaysController < ApplicationController
    def show
      render json: { 
        labels: %w( Jan Feb Mar Apr May Jun Jul ),
        datasets: [
          { label: params[:id], data: [31, 28, 31, 30, 31, 30, 31] }
        ]
      }
    end
  end
end
