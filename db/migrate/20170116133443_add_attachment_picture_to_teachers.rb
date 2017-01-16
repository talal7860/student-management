class AddAttachmentPictureToTeachers < ActiveRecord::Migration
  def self.up
    change_table :teachers do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :teachers, :picture
  end
end
