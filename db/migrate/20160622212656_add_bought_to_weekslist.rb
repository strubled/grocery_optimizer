class AddBoughtToWeekslist < ActiveRecord::Migration
  def change
  	add_column :weekslists, :bought, :boolean, default: false
  end
end
