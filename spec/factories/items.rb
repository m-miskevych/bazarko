FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Harry Potter #{n}" }
    price { 20 }
    association :category
    association :user
  end
end
