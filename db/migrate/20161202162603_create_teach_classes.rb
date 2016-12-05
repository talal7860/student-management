class CreateTeachClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :teach_classes do |t|
      t.uuid :teacher_id
      t.uuid :student_id
      t.uuid :course_id
      t.uuid :branch_id

      t.timestamps
    end
  end
end
