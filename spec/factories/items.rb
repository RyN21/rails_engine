FactoryBot.define do
  factory :item do
    merchant
    name        { Faker::JapaneseMedia::SwordArtOnline.item }
    description { Faker::TvShows::MichaelScott.quote }
    unit_price  { rand(1..500) }
  end
end
