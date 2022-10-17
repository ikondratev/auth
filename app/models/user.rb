class User < Sequel::Model
  plugin :association_dependencies
  plugin :secure_password, include_validations: false

  one_to_many :sessions, class: UserSession

  add_association_dependencies sessions: :delete

  def validate
    super

    validation_format(Constants::NAME_FORMAT, :name, message: I18n.t(:format, scope: 'model.errors.user.name'))
    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
    validates_presence :password, message: I18n.t(:blank, scope: 'model.errors.user.password_digest') if new?
  end
end
