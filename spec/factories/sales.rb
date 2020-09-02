FactoryBot.define do
  factory :sale do
    invoice
    credit_card_number                 { "MyString" }
    credit_card_expiration_date        { "MyString" }
    result                             { "success" }
  end
end
