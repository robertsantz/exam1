class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.text    :description
      t.integer :price
      t.string  :weight
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
