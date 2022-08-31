FactoryBot.define do
  factory :user do
    email { 'zida@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
    
  end
  factory :user_second, class: User do
    email { 'bbb@gmail.com' }
    password { '1234567' }
    password_confirmation { '1234567' }
    
  end
  factory :user_third, class: User do
    email { 'ddd@gmail.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
    
  end
end
