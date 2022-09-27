FactoryBot.define do
  sequence(:name) do |n|
    "Name_#{n}"
  end

  sequence(:email) do |n|
    "#{n}@example.com"
  end
end