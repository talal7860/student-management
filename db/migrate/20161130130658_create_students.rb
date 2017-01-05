class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :picture
      t.integer :student_class
      t.date :dob
      t.string :email
      t.integer :cnic, :limit => 8
      t.text :address
      t.integer :studying_status
      t.text :teacher_remarks
      t.string :user_id
      t.string :branch_id
      t.integer :matric_roll_no
      t.integer :matric_marks

      t.timestamps
    end
  end
end
