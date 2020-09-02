FactoryBot.define do
  factory :customer do
    first_name { Faker::JapaneseMedia::SwordArtOnline.real_name }
    last_name  { Faker::JapaneseMedia::SwordArtOnline.game_name }
  end
end
