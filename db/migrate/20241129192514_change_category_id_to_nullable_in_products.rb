class ChangeCategoryIdToNullableInProducts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :products, :category_id, true
  end
end
