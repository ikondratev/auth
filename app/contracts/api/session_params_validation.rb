module Api
  class SessionParamsValidation < Dry::Validation::Contract
    params do
      required(:email).filled(:string)
      required(:password).filled(:string)
    end

    rule(:email) do
      unless Constants::REGEXP_VALID_EMAIL.match?(value)
        key.failure("has invalid format")
      end
    end
  end
end
