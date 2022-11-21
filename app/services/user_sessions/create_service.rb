module UserSessions
  class CreateService
    prepend BaseService

    option :email
    option :password

    attr_reader :session

    def call
      validate
      create_session unless failure?
    end

    private

    def validate
      @user = ::User.find(email: @email)
      return fail_t!(:unauthorized) unless @user&.authenticate(@password)
    end

    def create_session
      @session = ::UserSession.new

      if @session.valid?
        @user.add_session(@session)
      else
        fail!(@session.errors)
      end
    end

    def fail_t!(key)
      fail!(I18n.t(key, scope: "services.user_sessions.create_service"))
    end
  end
end
