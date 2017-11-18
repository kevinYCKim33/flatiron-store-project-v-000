class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.string :title
      t.integer :inventory
      t.decimal :price, precision: 7, scale: 2
    end
  end
end
