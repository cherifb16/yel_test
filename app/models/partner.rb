class Partner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest_partner
    find_or_create_by!(email: 'partnerguest@gmail.com') do |partner|
      partner.password = SecureRandom.urlsafe_base64
    end
  end         
end
