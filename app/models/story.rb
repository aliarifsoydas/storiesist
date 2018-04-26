class Story < ApplicationRecord
    has_attached_file :media,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :media, :content_type => /\Aimage\/.*\Z/
  # add a delete_<image_name> method: 
  attr_accessor :delete_media
  before_validation { self.media.clear if self.delete_media == '1' }


  after_initialize do
    if new_record? && Story.exists?
      self.order ||= Story.last.order + 1
    else
      self.order = 1
    end
  end
end
