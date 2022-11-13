require_relative "config/environment"

use Rack::PostBodyContentTypeParser
use Rack::Ougai::LogRequests, Application.logger
use Rack::RequestId

run Rack::URLMap.new(
  "/auth" => AuthRoutes,
  "/user" => UserRoutes,
)