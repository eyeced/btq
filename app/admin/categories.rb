ActiveAdmin.register Category do
  index do |category|
    column :name
    column :parent
    column :description
    column :created_at
    column :updated_at
  end
end
