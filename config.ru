require_relative "config/environment"

use Rack::PostBodyContentTypeParser

map "/auth" do
  run UserRoutes
end