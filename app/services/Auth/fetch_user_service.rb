module Auth
  class FetchUserService
    prepend BaseService

    option :uuid

    attr_reader :user

    def call
      raise "Blank uuid" if @uuid.blank?

      session = fetch_session

      raise "User wasn't found" if session.blank?

      @user = session.user
    rescue StandardError => e
      fail!(I18n.t(:forbidden, scope: "services.auth.fetch_user_service"))
    end

    private

    def fetch_session
      UserSession.find(uuid: @uuid)
    rescue => e
      raise unless e.cause.kind_of?(PG::InvalidTextRepresentation)
    end
  end
end
