module Auth
  class FetchUserService
    prepend BaseService

    option :token

    attr_reader :user

    def call
      raise "Token is blank" if @token.blank?

      session = fetch_session(extracted_token)

      raise "User wasn't found" if session.blank?

      @user = session.user
    rescue StandardError
      fail!(I18n.t(:forbidden, scope: "services.auth.fetch_user_service"))
    end

    private

    def extracted_token
      JwtEncoder.decode(matched_token)
    rescue JWT::DecodeError
      {}
    end

    private

    def matched_token
      result = @token&.match(Constants::REGEXP_VALID_AUTH)

      return if result.blank?

      result[:token]
    end

    def fetch_session(uuid)
      UserSession.find(uuid: uuid)
    rescue StandardError => e
      raise e unless e.cause.is_a?(PG::InvalidTextRepresentation)
    end
  end
end
