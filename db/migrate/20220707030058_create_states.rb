class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.boolean :continental
      t.integer :lakes
      t.string :biome
      t.float :land_area

      t.timestamps
    end
  end
end
