class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :dish_id

      t.timestamps
    end
  end
end
