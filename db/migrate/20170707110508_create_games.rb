class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :answer

      t.timestamps null: false
    end
  end
end
