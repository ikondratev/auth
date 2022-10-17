Sequel.seed do
  def run
    User.create \
      name: "Richard Feynman",
      email: "test@email.com",
      password_digest: "799d97fed25e7e1fab1cc6c1b525f00c"
  end
end