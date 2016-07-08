class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.text :store
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :stores, [:user_id, :created_at]
  end
end
