ActiveAdmin.register Product do

  show do
    attributes_table do
      row :name
      row :description
      row :quantity
      row :price
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

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :quantity
      f.input :price
      f.input :trends
    end
    f.has_many :images do |fi|
      fi.inputs "Image" do
#       if !fi.object.nil?
#         fi.input :_destroy, :as => :boolean, :label => "Destroy?"
#       end
        fi.input :path, :as => :file
      end
    end

#    f.has_and_belongs_to_many :trends do |ft|
#      ft.input :id, :as => :select, :include_blank => false
#    end
    f.buttons
  end
end
