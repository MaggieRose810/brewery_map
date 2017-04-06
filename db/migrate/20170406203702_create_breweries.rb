class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.boolean :is_organic
      t.string :website
      t.string :status
      t.string :ext_id, null: false
      t.text :description
      t.string :status_display
      t.string :name
      t.timestamps
      t.index :ext_id, unique: true
    end
  end
end