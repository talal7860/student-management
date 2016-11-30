class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :picture
      t.integer :class
      t.date :dob
      t.string :email
      t.integer :cnic
      t.text :address
      t.string :studying_status
      t.text :teacher_remarks
      t.uuid :parent_id
      t.uuid :branch_id
      t.integer :matric_roll_no
      t.integer :matric_marks

      t.timestamps
    end
  end
end
