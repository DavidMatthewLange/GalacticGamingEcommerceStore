class ChangePlatformIdToNullableInProducts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :products, :platform_id, true
  end
end
