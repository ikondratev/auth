FactoryBot.define do
  factory :user do
    name { "User name" }
    email { "test@email.com" }
    password_digest { "799d97fed25e7e1fab1cc6c1b525f00c" }
  end
end