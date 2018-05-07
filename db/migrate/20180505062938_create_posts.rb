class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :post do |t|
      t.string :title
      t.text :content
      # t.image :image #박결 추가
      t.timestamps
    end
  end
end
