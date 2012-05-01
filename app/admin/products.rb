ActiveAdmin.register Product do

  show do
    attributes_table do
      row :name
      row :description
      row :quantity
      row :price
      row :category
      row :created_at
      row :updated_at
    end
    div do
      render "show_trends"
    end
    div do
      render "show_images"
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :quantity
      f.input :price
      f.input :trends
      f.input :category, :as => :select, :collection => Product.categories
    end

    f.inputs "Product Images" do
      f.has_many :images do |fi|
        fi.input :path, :as => :file, :label => "Image", :hint => fi.template.image_tag(fi.object.path.url(:thumb))
        fi.input :_destroy, :as => :boolean, :required => false, :label => "Destroy?"
      end
    end
    f.buttons
  end
end
