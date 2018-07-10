class AddPreviewToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :preview, :text
  end
end
