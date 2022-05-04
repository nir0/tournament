class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :division
      t.integer :team_1_id
      t.integer :team_2_id
      t.integer :winner_id
      t.integer :stage

      t.timestamps
    end
  end
end
