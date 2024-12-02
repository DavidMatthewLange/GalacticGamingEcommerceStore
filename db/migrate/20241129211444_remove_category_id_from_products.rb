class RemoveCategoryIdFromProducts < ActiveRecord::Migration[7.2]
  def change
    remove_column :products, :category_id, :integer
  end
end
