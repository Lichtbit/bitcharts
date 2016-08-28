class Bitcharts::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def create_initializer
    template 'bitcharts.rb', File.join('config/initializers/bitcharts.rb')
  end
end
