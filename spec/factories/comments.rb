FactoryBot.define do
  factory :comment do
    user_id { user_id }
    property_id { property_id }
    name { 'bella' }
    description { 'bella2' }
  end
  factory :comment_second, class: Comment do
    user_id { user_id }
    property_id { property_id }
    name { 'bella' }
    description { 'bella2' }
  end
end
