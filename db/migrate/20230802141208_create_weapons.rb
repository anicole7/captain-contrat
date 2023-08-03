class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.boolean :defensive
      t.integer :weight
      t.integer :stats_bonus

      t.timestamps
    end
  end
end
