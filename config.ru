require_relative "config/environment"

use Rack::PostBodyContentTypeParser

run Rack::URLMap.new(
  "/auth" => AuthRoutes,
  "/user" => UserRoutes,
)