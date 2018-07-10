class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :article
      t.text :image_url
      t.string :category

      t.timestamps
    end
  end
end
