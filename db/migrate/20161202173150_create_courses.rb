# db
class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses, id: :uuid do |t|
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
