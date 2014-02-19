class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :category
      t.string :title
      t.text :content
      t.integer :pin

      t.timestamps
    end
  end
end
