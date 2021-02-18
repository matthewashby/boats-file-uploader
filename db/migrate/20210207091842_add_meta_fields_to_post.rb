class AddMetaFieldsToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :meta_title, :string, default: ''
    add_column :posts, :meta_tags, :string, default: ''
    add_column :posts, :meta_description, :string, default: ''
  end
end
