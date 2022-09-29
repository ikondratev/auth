module JwtEncoder
  extend self

  SECRET = Settings.auth.secret

  def encode(payload)
    JWT.encode(payload, SECRET)
  end

  def decode(token)
    JWT.decode(token, SECRET).first
  end
end
