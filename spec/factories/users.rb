FactoryBot.define do
  factory :user do
    name { generate(:name) }
    email { generate(:email) }
    password { "test_password" }
  end
end