FactoryBot.define do
  factory :user do
    username {"test"}
    email{Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
