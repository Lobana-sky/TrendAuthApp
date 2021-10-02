class CreateCurrentNews < ActiveRecord::Migration[6.1]
  def change
    create_table :current_news do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :author
      t.string :image
      t.string :language
      t.datetime :published
      t.integer :category_id
      t.string :id_news
      t.timestamps
    end
  end
end
