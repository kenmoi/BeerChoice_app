class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment, null: false
      t.integer :user_id, null: false
      t.integer :beer_id, null: false
      t.float :rate, null: false, default: 0

      t.timestamps
    end
  end
end
