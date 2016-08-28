require "bitcharts/engine"
require "jquery-rails"
require "coffee-rails"

module Bitcharts
  mattr_accessor(:application_controller_class) { 'ActionController::Base' }
  mattr_accessor(:authorize_request) { Proc.new { logger.warn 'Missing authorization for Bitcharts' } }

  def self.application_controller_class
    @@application_controller_class.constantize
  end
end
