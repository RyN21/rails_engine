FactoryBot.define do
  factory :sale do
    invoice_id                         { 1 }
    credit_card_number                 { "MyString" }
    credit_card_number_expiration_date { "MyString" }
    result                             { "MyString" }
  end
end
