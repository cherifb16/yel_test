FactoryBot.define do
    factory :admin do
        email { 'bella@gmail.com' }
        password { '1234567' }
        password_confirmation { '1234567' }
    end
  end