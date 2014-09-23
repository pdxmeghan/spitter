class CreateDigs < ActiveRecord::Migration
  def change
    create_table :digs do |t|
      t.integer :spit_id
      t.integer :user_id

      t.timestamps
    end
  end
end
