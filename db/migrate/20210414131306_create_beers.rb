class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.integer :user_id
      t.string :image_id
      t.string :feature
      t.string :name, null: false
      t.integer :style, null: false, default: 0
      t.integer :retailer, null: false, default: 0
      t.string :origin
      t.string :abv
      t.text :explanation

      t.timestamps
    end
  end
end
