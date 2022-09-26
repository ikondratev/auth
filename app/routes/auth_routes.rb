class UserRoutes < Application
  namespace "/signup" do
    post do
      valid_params = validate_with!(UserParamsValidation)

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
  end

  namespace "/login" do
    post do
      valid_params = validate_with!(SessionParamsValidation)

      result = UserSessions::CreateService.call(
        email: valid_params[:email],
        password: valid_params[:password]
      )

      if result.success?
        status 201
        json token: result.session.uuid
      else
        status 422
        error_response result.errors
      end
    end
  end
end
