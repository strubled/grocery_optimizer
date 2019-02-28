class AddOnweekslistToWeekslists < ActiveRecord::Migration
  def change
    add_column :weekslists, :onweekslist, :boolean, default: false
  end
end
