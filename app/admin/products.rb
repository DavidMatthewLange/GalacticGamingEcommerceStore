ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_qty, :image_url, category_ids: [], platform_ids: []
  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_qty
      f.input :categories, as: :check_boxes
      f.input :platforms, as: :check_boxes
      f.input :image_url
    end
    f.actions
  end
end
