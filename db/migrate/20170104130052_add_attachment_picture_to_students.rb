class AddAttachmentPictureToStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :students, :picture
  end
end
