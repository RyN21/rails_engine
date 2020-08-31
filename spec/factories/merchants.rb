FactoryBot.define do
  factory :merchant do
    name { Faker::Movies::Hobbit.location }
  end
end
