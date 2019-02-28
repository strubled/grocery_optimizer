class CreateAllitems < ActiveRecord::Migration
  def change
    create_table :allitems do |t|
      t.text :thing
      t.text :zone
      t.text :store
      t.text :amount
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :allitems, [:user_id, :created_at]
  end
end
