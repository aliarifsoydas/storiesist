class Story < ApplicationRecord
  has_one_attached :media

  attr_accessor :remove_media
  after_save { media.purge if remove_media == "1" }

  after_initialize do
    if new_record? && Story.exists?
      self.order ||= Story.last.order + 1
    else
      self.order = 1
    end
  end
end
