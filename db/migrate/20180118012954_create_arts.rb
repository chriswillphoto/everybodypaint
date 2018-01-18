class CreateArts < ActiveRecord::Migration[5.1]
  def change
    create_table :arts do |t|
      t.text :data
      t.timestamps
    end
  end
end
