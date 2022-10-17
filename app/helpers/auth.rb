module Auth
  def extracted_token
    JwtEncoder.decode(matched_token)
  rescue JWT::DecodeError
    {}
  end

  private

  def matched_token
    result = auth_header&.match(Constants::REGEXP_VALID_AUTH)

    return if result.blank?

    result[:token]
  end

  def auth_header
    request.env[Constants::HTTP_AUTHORIZATION_HEADER]
  end
end
