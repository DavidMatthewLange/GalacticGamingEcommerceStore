class AddImageUrlSummaryAndManufacturerToPlatforms < ActiveRecord::Migration[7.2]
  def change
    add_column :platforms, :image_url, :string
    add_column :platforms, :summary, :text
    add_column :platforms, :manufactuer, :string
  end
end
