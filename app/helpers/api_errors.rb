require 'sinatra/extension'

module ApiErrors
  extend Sinatra::Extension

  helpers do
    def error_response(error_messages)
      errors = case error_messages
               when Sequel::Model
                 ErrorHandler.from_model(error_messages)
               else
                 ErrorHandler.from_messages(error_messages)
               end

      json errors
    end
  end

  error Sequel::NoMatchingRow do
    status 404
    error_response I18n.t(:not_found, scope: 'api.errors')
  end

  error Sequel::UniqueConstraintViolation do
    status 422
    error_response I18n.t(:not_unique, scope: 'api.errors')
  end

  error Validations::InvalidParams, KeyError do
    status 422
    error_response I18n.t(:validation_error, scope: 'api.errors')
  end

  error StandardError do
    status 500
    error_response I18n.t(:unexpected_error, scope: 'backend.errors')
  end
end
