ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_qty, :image, category_ids: [], platform_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :stock_qty
    column :categories do |product|
      product.categories.map(&:name).join(", ")
    end
    column :platforms do |product|
      product.platforms.map(&:name).join(", ")
    end
    column :image do |product|
      if product.image.attached?
        image_tag product.image.variant(resize_to_limit: [ 50, 50 ])
      else
        "No image"
      end
    end
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_qty
      f.input :categories, as: :check_boxes
      f.input :platforms, as: :check_boxes

      # ActiveStorage image upload
      f.input :image, as: :file, hint: f.product.image.attached? ? image_tag(f.product.image.variant(resize_to_limit: [ 150, 150 ])) : content_tag(:span, "No image uploaded.")
    end
    f.actions
  end
end
