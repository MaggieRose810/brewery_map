class CreateCrawls < ActiveRecord::Migration[5.0]
  def change
    create_table :crawls do |t|
      t.string :name, null: false
      t.string :endpoint, null: false
      t.datetime :completed_at
      t.timestamps
    end
  end
end
