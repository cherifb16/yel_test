class Property < ApplicationRecord

    has_many_attached :images, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :reservations, dependent: :destroy
    
    validates :name, presence: true
    validates :headline, presence: true
    validates :description, presence: true
    validates :address_1, presence: true
    validates :city, presence: true
    validates :state, presence: true

    scope :search_name, -> name {where("name LIKE ?", "%#{name}%")}
    
    monetize :price_cents, allow_nil: false

    after_validation :get_price_cents
    
    geocoded_by :address
    after_validation :geocode
    # , if: -> { latitude.blank? && longitude.blank? }

    def address
        # [address_1, address_2, city, state, country].compact.join(', ')
        [state, country].compact.join(', ')
    end

    def get_price_cents
        price_cents.to_i * 100
    end

    def default_image
        images.first
    end
end
