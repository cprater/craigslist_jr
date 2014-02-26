class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.integer :karma
      t.text :about

      t.timestamps
    end
  end
end
