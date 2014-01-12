class Dbsetup < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.integer :purchaser_id
      t.integer :merchant_id
      t.string :description
      t.decimal :price
      t.decimal :count
    end

    add_index :items, :purchaser_id
    add_index :items, :merchant_id


    create_table :merchants do |t|
      t.string :address
      t.string :name
    end

    add_index :merchants, :name


    create_table :purchasers do |t|
      t.string :name
    end
    add_index :purchasers, :name

  end

  def down
  end
end
