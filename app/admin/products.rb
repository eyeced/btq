ActiveAdmin.register Product do

  show do |product|
    attributes_table do
      row :name
      row :description
      row :price
      row "Parent Category" do
        product.category.parent.name
      end
      row "Category" do
        product.category.name 
      end
      row :created_at
      row :updated_at
    end
    div do
      render "show_product_items"
    end
    div do
      render "show_trends"
    end
    div do
      render "show_images"
    end
  end

#  form :partial => "form" 
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :trends
			f.input :brand, :collection => Brand.all
      f.input :category, :collection => Category.sub_categories.collect! {|sub| sub.name = sub.parent.name + " -> " + sub.name; sub}
    end

    f.inputs "ProductItems" do
      f.has_many :product_items do |fpi|
        fpi.input :quantity
        fpi.input :size, :as => :select, :collection => Product.sizes 
        fpi.input :_destroy, :as => :boolean, :required => false, :label => "Destroy?"
      end
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
