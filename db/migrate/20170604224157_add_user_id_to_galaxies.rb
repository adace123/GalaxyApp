class AddUserIdToGalaxies < ActiveRecord::Migration[5.1]
  def change
    add_column :galaxies, :user_id, :integer
  end
end
