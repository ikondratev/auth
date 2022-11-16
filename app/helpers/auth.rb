module Auth
  include ::TokenEncoder
  def extract_token
    extracted_token(auth_header)
  end

  private

  def auth_header
    request.env[Constants::HTTP_AUTHORIZATION_HEADER]
  end
end
