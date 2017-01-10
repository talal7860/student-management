class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students, id: :uuid do |t|
      t.string :name
      t.string :picture
      t.integer :student_class
      t.date :dob
      t.integer :gender
      t.string :email
      t.string :cnic
      t.text :address
      t.integer :studying_status
      t.text :teacher_remarks
      t.uuid :parent_id
      t.uuid :branch_id
      t.integer :matric_roll_no
      t.integer :matric_marks

      t.timestamps
    end
  end
end
