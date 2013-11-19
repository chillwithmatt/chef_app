class AddForSaleToDishes < ActiveRecord::Migration
  def change
  	add_column :dishes, :for_sale, :boolean, default: false
  end
end
