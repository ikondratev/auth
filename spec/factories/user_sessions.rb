FactoryBot.define do
  factory :user_session do
    uuid { "generated_uuid" }
    user_id { 1 }
  end
end