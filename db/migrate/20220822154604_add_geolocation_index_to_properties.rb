class AddGeolocationIndexToProperties < ActiveRecord::Migration[6.0]
  def change
    add_index :properties, [:latitude, :longitude]
  end
end
