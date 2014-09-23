class AddTallyToSpits < ActiveRecord::Migration
  def change
  	add_column :spits, :tally, :integer, :default => 0
  end
end
