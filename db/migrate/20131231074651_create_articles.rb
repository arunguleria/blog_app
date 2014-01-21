class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :author_id

      t.timestamps
    end
    add_index :articles, :id
    add_index :articles, :author_id
    add_index :articles, :title
  end
end
