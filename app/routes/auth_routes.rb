class AuthRoutes < Application
  helpers Auth

  namespace "/v1" do
    post "/" do
      result = Auth::FetchUserService.call(token: extract_token)

      if result.success?
        status 200
        json meta: { user_id: result.user.id }
      else
        status 403
        error_response result.errors
      end
    end
  end
end
