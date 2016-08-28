Bitcharts.application_controller_class = '::ApplicationController'

Bitcharts.authorize_request = Proc.new do
  logger.debug 'Authorization for dummies'
end