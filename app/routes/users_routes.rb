class UserRoutes < Application
  namespace "/ping" do
    get do
      "PONG"
    end
  end

  namespace "/create_user" do
    post do
      user_params = validate_with!(UserParamsValidation)

      result = User::CreateService.call(user_params)

      if result.success?
        status 201
      else
        status 422
        error_response(result.errors, :unprocessable_entity)
      end
    end
  end
end
