class RemoveFieldContent < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :content if column_exists?(:posts, :content)
  end
end
