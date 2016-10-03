class AddOnweekslistToAllitems < ActiveRecord::Migration
  def change
    add_column :allitems, :onweekslist, :boolean, default: false
   
  end
end
