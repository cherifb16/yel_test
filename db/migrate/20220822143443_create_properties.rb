class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :headline
      t.text :description
      t.string :city
      t.string :state
      t.string :country
      t.string :address_1
      t.string :address_2
      t.string :zip_code

      t.timestamps
    end
  end
end
