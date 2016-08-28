Bitcharts.application_controller_class = '::ApplicationController'

Bitcharts.authorize_request = Proc.new do
  charts.each do |chart|
    authorize!(:show, chart.class)
  end
end