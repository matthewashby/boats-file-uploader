class ChangeData < ActiveRecord::Migration[6.0]
  def up
    change_column :posts, :short_description, :text
  end
end
