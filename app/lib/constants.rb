module Constants
  REGEXP_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  NAME_FORMAT = %r{\A\w+\z}.freeze
  AUTH_TOKEN_REGEXP = %r{\ABearer}.freeze
end
