class AddIsfrontToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :isfront, :boolean
  end
end
