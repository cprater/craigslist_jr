class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.string :link
      t.text :content
      t.integer :votes

      t.timestamps
    end
  end
end