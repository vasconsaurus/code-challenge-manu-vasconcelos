FactoryBot.define do
  factory :invitation do
    email { "test@example.com" }
    message { "MyText" }
    cycle
  end
end
