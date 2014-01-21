class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :date_of_birth
      t.string :website
      t.string :facebook_page
      t.string :github_url
      t.integer :author_id

      t.timestamps
    end
    add_index :profiles, :id
    add_index :profiles, :website
    add_index :profiles, :github_url
    add_index :profiles, :facebook_page
    add_index :profiles, :author_id
  end
end
