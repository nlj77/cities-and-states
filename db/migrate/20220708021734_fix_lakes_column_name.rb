class FixLakesColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :"states", :"lakes", :"number_of_lakes"
  end
end
