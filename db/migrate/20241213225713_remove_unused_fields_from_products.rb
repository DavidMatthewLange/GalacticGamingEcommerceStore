class RemoveUnusedFieldsFromProducts < ActiveRecord::Migration[7.2]
  def change
    remove_column :products, :developer, :string
    remove_column :products, :release_date, :date
    remove_column :products, :rating, :decimal
  end
end
