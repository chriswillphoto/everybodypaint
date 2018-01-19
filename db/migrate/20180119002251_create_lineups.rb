class CreateLineups < ActiveRecord::Migration[5.1]
  def change
    create_table :lineups do |t|
      t.text :user
      t.timestamps
    end
  end
end
