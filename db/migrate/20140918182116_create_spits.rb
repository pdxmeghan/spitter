class CreateSpits < ActiveRecord::Migration
  def change
    create_table :spits do |t|
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
