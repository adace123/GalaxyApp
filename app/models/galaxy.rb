class Galaxy < ApplicationRecord
     has_attached_file :image, styles: {large: "600x600>", medium: "300x300>", thumbnail: "150x150#"}
     validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
     validates_presence_of :image, :message => " must be attached."
     validates_presence_of :galaxy_type, :message => " can't be empty."
     validates_presence_of :name, :message => " can't be empty."
     validates_presence_of :mass, :message => " can't be empty."
     validates_presence_of :distance, :message => " can't be empty."
     validates_presence_of :num_stars, :message => " can't be empty."
     validates_presence_of :diameter, :message => " can't be empty."
     validates_presence_of :notable_features, :message => " were either not saved or are empty."
     validates :mass, :numericality => { greater_than: 0 }
     validates :distance, :numericality => { greater_than: 0 }
     validates :num_stars, :numericality => { greater_than: 0 }
     validates :diameter, :numericality => { greater_than: 0 }
     validates_uniqueness_of :name, :message => " already in database."
     
     belongs_to :user
end
