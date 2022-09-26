require "securerandom"

class UserSession < Sequel::Model
  def before_create
    super
    self.uuid = SecureRandom.uuid
  end
end
