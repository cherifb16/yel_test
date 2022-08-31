FactoryBot.define do
  factory :property do
    name { 'MyString' }
    headline { 'MyText' }
    description { 'MyText' }
    city { 'MyText' }
    state { 'MyText' }
    country { 'MyText' }
    address_1 { 'MyText' }
    address_2 { 'MyText' }
    price_cents { 'MyString' }
    zip_code { 'MyString' }
    images { 'MyText' }
    user { nil }
    reservation { nil }
  end
end
