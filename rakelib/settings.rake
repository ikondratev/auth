task :settings do
  require "config"
  require_relative "../config/initializers/config"
end

task default: %i[linters:rubocop]