class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams, id: :uuid do |t|
      t.uuid :course_id
      t.uuid :teacher_id
      t.uuid :student_id
      t.integer :exam_type
      t.integer :marks_obtained
      t.integer :total_marks

      t.timestamps
    end
  end
end
