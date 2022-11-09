module TokenEncoder
  def extracted_token(raw_token)
    JwtEncoder.decode(matched_token(raw_token))
  rescue JWT::DecodeError
    {}
  end

  def matched_token(raw_token)
    result = raw_token&.match(Constants::REGEXP_VALID_AUTH)

    return if result.blank?

    result[:token]
  end
end
