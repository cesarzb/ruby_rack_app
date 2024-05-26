# frozen_string_literal: true

app_files = File.expand_path('app/**/*.rb', __dir__)
Dir.glob(app_files) { |file| require(file) }

# This is main class for the application
class Application
  def call(env)
    request = Rack::Request.new(env)
    serve_request(request)
  end

  def serve_request(request)
    session = request.env['rack.session']
    Router.new(request).route!(session)
  end
end
