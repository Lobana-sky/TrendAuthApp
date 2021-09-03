class AddIndexToCurrentNews < ActiveRecord::Migration[6.1]
  def change
    add_index :current_news, :id_news, unique: true
  end
end
