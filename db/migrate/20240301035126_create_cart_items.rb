class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.decimal :total_price
      t.integer :qty
      t.boolean :order_completed

      t.timestamps
    end
  end
end
