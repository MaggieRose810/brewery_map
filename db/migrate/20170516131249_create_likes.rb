class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.boolean :positive, null: false
      t.string :user_uuid, null: false
      t.string :beer_ext_id, null: false
      t.timestamps
    end
  end
end
