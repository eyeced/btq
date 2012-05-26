class AddDescriptionToTrends < ActiveRecord::Migration
  def change
    add_column :trends, :description, :string
  end
end
