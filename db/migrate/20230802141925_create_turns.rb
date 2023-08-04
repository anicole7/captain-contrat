class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.integer :number
      t.integer :damage
      t.integer :oponent_health_remaining
      t.references :fight, index: true, foreign_key: {to_table: :fights}
      t.references :champion, index: true, foreign_key: {to_table: :champions}

      t.timestamps
    end
  end
end
