require "digest"

class User < Sequel::Model
  plugin :association_dependencies

  one_to_many :sessions, class: UserSession

  add_association_dependencies sessions: :delete

  def validate
    super

    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
    validates_presence :password_digest, message: I18n.t(:blank, scope: 'model.errors.user.password_digest')
  end

  def authenticate(*payload)
    password_digest == self.class.secure_password(payload)
  end

  def self.secure_password(*payload)
    salt = payload.join(":")
    Digest::MD5.hexdigest salt
  end
end
