module Users
  class CreateService
    prepend BaseService

    option :name
    option :email
    option :password

    attr_reader :user

    def call
      @user = ::User.new(
        name: @name,
        email: @mail,
        password: password
      )

      if @user.valid?
        @user.save
      else
        fail!(@user.errors)
      end
    end
  end
end
