module Model
  class UserParamsValidation < Dry::Validation::Contract
    params do
      required(:name).filled(:string)
      required(:email).filled(:string)
      required(:password).filled(:string)
    end

    rule(:email) do
      unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
        key.failure("email has invalid format")
      end
    end

    rule(:name) do
      unless /\A\w+\z/i.match?(value)
        key.failure("name has invalid format")
      end
    end
  end
end
