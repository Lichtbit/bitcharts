module Bitcharts
  class ApplicationController < ActionController::Base
    before_action :load_charts unless Rails.configuration.eager_load

    def load_paths
      [File.expand_path('app/charts', Rails.root)]
    end

    def load_charts
      unless loaded?
        files.each{ |file| require_dependency(file) }
        @@loaded = true
      end
    end

    def files
      load_paths.flatten.compact.uniq.flat_map{ |path| Dir["#{path}/**/*.rb"] }
    end

    def loaded?
      Rails.configuration.eager_load || (@@loaded ||= false)
    end
  end
end
