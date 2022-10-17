module Constants
  REGEXP_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  NAME_FORMAT = %r{\A\w+\z}.freeze
  REGEXP_VALID_AUTH = %r{\ABearer (?<token>.+)\z}.freeze
  HTTP_AUTHORIZATION_HEADER = "HTTP_AUTHORIZATION".freeze
end
