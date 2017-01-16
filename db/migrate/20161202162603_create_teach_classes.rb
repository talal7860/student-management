class CreateTeachClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :teach_classes, id: :uuid do |t|
      t.uuid :teacher_id
      t.integer :student_year
      t.uuid :course_id
      t.uuid :branch_id

      t.timestamps
    end
  end
end
