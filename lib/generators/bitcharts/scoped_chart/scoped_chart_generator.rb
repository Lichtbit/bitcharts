class Bitcharts::ScopedChartGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  check_class_collision suffix: 'Chart'

  def create_chart_model
    template 'chart_model.rb', File.join('app/charts', class_path, "#{file_name}_chart.rb")
  end
end
