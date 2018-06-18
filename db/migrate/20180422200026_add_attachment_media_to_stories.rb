class AddAttachmentMediaToStories < ActiveRecord::Migration[5.2]
  def self.up
    change_table :stories do |t|
      t.attachment :media
    end
  end

  def self.down
    remove_attachment :stories, :media
  end
end
