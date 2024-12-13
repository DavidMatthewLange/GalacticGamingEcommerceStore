class AddReleaseDateDeveloperAndRatingToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :release_date, :date
    add_column :products, :developer, :string
    add_column :products, :rating, :decimal
  end
end
