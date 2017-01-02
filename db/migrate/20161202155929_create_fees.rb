class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.string :student_id
      t.integer :amount
      t.date :pay_date
      t.integer :scholarship
      t.integer :pay_status

      t.timestamps
    end
  end
end
