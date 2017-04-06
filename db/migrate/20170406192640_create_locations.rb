class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :status
      t.string :region
      t.decimal :latitude, precision: 10, scale: 6
      t.string :name
      t.string :ext_id, null: false
      t.string :website
      t.decimal :longitude, precision: 10, scale: 6
      t.string :phone
      t.string :location_type
      t.string :postal_code
      t.string :country_iso_code
      t.string :brewery_ext_id, null: false
      t.string :locality
      t.string :street_address
      t.timestamps
      t.index :ext_id, unique: true
      t.index :brewery_ext_id
    end
  end
end
