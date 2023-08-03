class CreateChampions < ActiveRecord::Migration[7.0]
  def change
    create_table :champions do |t|
      t.string :name
      t.integer :health_point
      t.integer :attack_point
      t.references :left_weapon, index: true, foreign_key: {to_table: :weapons}
      t.references :right_weapon, index: true, foreign_key: {to_table: :weapons}

      t.timestamps
    end
  end
end
