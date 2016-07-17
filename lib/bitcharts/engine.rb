module Bitcharts
  class Engine < ::Rails::Engine
    isolate_namespace Bitcharts
    config.autoload_paths += %W(#{config.root}/app/charts)
  end
end
