class CreateGalaxies < ActiveRecord::Migration[5.1]
  def change
    create_table :galaxies do |t|
      t.string :galaxy_type
      t.float :distance
      t.integer :num_stars
      t.float :diameter
      t.float :mass
      t.text :notable_features

      t.timestamps
    end
  end
  
 
end
