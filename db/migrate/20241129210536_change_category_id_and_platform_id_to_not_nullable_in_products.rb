class ChangeCategoryIdAndPlatformIdToNotNullableInProducts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :products, :category_id, false
    change_column_null :products, :platform_id, false
  end
end
