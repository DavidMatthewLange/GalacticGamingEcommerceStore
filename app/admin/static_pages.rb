ActiveAdmin.register StaticPage do
  permit_params :title, :content, :slug

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug, input_html: { readonly: true } # Prevent changing the slug accidentally
      f.input :content, as: :text
    end
    f.actions
  end
end
