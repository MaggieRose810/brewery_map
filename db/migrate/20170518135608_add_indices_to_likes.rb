class AddIndicesToLikes < ActiveRecord::Migration[5.0]
  def change
    add_index(:likes, :beer_ext_id)
  end
end
