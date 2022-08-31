require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'アソシエーションテスト' do
    let!(:reservation) { FactoryBot.create(:reservation) }
    let!(:property) { FactoryBot.create(:property, reservation: reservation) }
    context 'If the property is deleted' do
      it 'Associated COMMENTS are also deleted' do
        FactoryBot.create(:comment,  property_id: property.id)
        expect { property.destroy }.to change { Comment.count }.by(-1)
      end
    end
  end
end
