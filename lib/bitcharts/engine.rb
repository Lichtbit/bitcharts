module Bitcharts
  class Engine < ::Rails::Engine
    isolate_namespace Bitcharts
    config.autoload_paths += %W(#{config.root}/app/charts)
    config.to_prepare do
      ::ApplicationController.helper(Bitcharts::ApplicationHelper)
      Rails.application.config.assets.precompile += %w(
        bitcharts/default.js
        bitcharts/full.js
        bitcharts/init.js
      )
    end
  end
end
