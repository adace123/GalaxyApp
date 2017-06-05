class AddNameColumnToGalaxies < ActiveRecord::Migration[5.1]
  def change
    add_column :galaxies, :name, :string
  end
end
