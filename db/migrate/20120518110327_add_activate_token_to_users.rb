class AddActivateTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activate_token, :string
    add_column :users, :active, :boolean, :default => false
  end
end
