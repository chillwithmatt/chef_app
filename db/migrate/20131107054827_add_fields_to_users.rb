class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :style, :string
    add_column :users, :signature_dish, :string
  end
end
