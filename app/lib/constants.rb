module Constants
  REGEXP_VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  NAME_FORMAT = /\A\w+\z/i.freeze
end