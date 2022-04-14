class CreateMerchandises < ActiveRecord::Migration[6.0]
  def change
    create_table :merchandises do |t|
      t.references :user,                null: false, foreign_key: true
      t.string     :goods_name,          null: false
      t.integer    :price,               null: false
      t.integer    :prefecture_id,       null: false
      t.text       :explain,             null: false
      t.integer    :category_id,         null: false
      t.integer    :condition_id,        null: false
      t.integer    :delivery_fee_id,     null: false
      t.integer    :date_of_shipping_id, null: false

      t.timestamps
    end
  end
end
