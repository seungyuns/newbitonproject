class AddImageToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :post, :image, :string
  end
end
