class Comment < ApplicationRecord
    has_one :properties
    has_one :user, dependent: :destroy
end
