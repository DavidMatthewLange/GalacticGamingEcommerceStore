class CreatePlatforms < ActiveRecord::Migration[7.2]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :manufacturer
      t.date :release_date

      t.timestamps
    end
  end
end
