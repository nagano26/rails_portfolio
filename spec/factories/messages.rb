FactoryBot.define do
  factory :message do
    user { nil }
    talk { nil }
    content { "MyText" }
  end
end
