# Usage: in develoopment.rb
#
#   config.middleware.insert_before Rails::Rack::Logger, DisableAssetsLogger
#
class DisableAssetsLogger
  def initialize(app)
    @app = app
  end

  def call(env)
    previous_level = Rails.logger.level
    Rails.logger.level = Logger::WARN if env['PATH_INFO'].start_with?("/assets/")
    @app.call(env)
  ensure
    Rails.logger.level = previous_level
  end
end