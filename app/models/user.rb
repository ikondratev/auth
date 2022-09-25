class User < Sequel::Model
  def validate
    super
    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
    validates_presence :password, message: I18n.t(:blank, scope: 'model.errors.user.password_digest')
  end
end
