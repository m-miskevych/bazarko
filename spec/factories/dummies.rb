FactoryBot.define do
  factory :dummy do
    name { "MyString" }
    age { rand(1..100) }
    born_at { "2025-02-10 15:37:12" }
  end
end
