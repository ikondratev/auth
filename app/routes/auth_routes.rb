class AuthRoutes < Application
  get "/ping" do
    "PONG"
  end

  namespace "/v1" do
    post "/signup" do
      valid_params = validate_with!(Api::UserParamsValidation)

      result = Users::CreateService.call(
        name: valid_params[:name],
        email: valid_params[:email],
        password: valid_params[:password]
      )

      if result.success?
        status 201
      else
        status 422
        error_response result.user
      end
    end

    post "/login" do
      valid_params = validate_with!(Api::SessionParamsValidation)

      result = UserSessions::CreateService.call(
        email: valid_params[:email],
        password: valid_params[:password]
      )

      if result.success?
        status 201
        json meta: { token: result.session.uuid }
      else
        status 422
        error_response result.errors
      end
    end
  end
end
