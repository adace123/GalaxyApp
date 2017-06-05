class AddAttachmentImageToGalaxies < ActiveRecord::Migration[4.2]
  def self.up
    change_table :galaxies do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :galaxies, :image
  end
end
