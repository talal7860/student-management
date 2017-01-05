class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances, id: :uuid do |t|
      t.date :date
      t.uuid :student_id
      t.uuid :course_id
      t.integer :status

      t.timestamps
    end
  end
end
