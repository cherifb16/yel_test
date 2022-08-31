require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'association test' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:reservation) { FactoryBot.create(:reservation) }
    let!(:property) { FactoryBot.create(:property, reservation: reservation) }
    context 'If the RESERVATION is deleted' do
      it 'Associated Favourites are also deleted.' do
        FactoryBot.create(:favorite, user_id: user.id, reservation_id: reservation.id)
        expect { reservation.destroy }.to change { Favorite.count }.by(-1)
      end
      it 'Associated PROPERTIES are also deleted.' do
        expect { reservation.destroy }.to change { property.count }.by(-1)
      end
    end
  end
  describe 'geolocation' do
    context 'If a RESERVATION is created' do
      let!(:reservation) { FactoryBot.create(:reservation) }
      it 'Checkin and checkout stored' do
        expect(reservation.checkin_date).to be_present
        expect(reservation.checkout_date).to be_present
      end
    end
  end
end
