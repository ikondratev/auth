module Model
  class UserParamsValidation < Dry::Validation::Contract
    params do
      required(:name).filled(:string)
      required(:email).filled(:string)
      required(:password).filled(:string)
    end

    rule(:email) do
      unless Constants::REGEXP_VALID_EMAIL.match?(value)
        key.failure("email has invalid format")
      end
    end

    rule(:name) do
      unless Constants::NAME_FORMAT.match?(value)
        key.failure("name has invalid format")
      end
    end
  end
end
