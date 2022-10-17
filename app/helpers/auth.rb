module Auth
  def extracted_token
    JwtEncoder.decode(matched_token)
  rescue JWT::DecodeError
    {}
  end

  private

  def matched_token
    result = auth_header&.match(Constants::AUTH_TOKEN_REGEXP)

    return if result.blank?

    result[:token]
  end

  def auth_header
    request.env("HTTP_AUTHORIZATION")
  end
end