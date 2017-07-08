class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :g_num
      t.integer :number
      t.integer :strike
      t.integer :ball
      t.timestamps null: false
    end
  end
end
