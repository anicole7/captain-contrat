class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.datetime :date
      t.references :champion_1, index: true, foreign_key: {to_table: :champions}
      t.references :champion_2, index: true, foreign_key: {to_table: :champions}

      t.timestamps
    end
  end
end
