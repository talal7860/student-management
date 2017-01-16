class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches, id: :uuid do |t|
      t.string :name
      t.integer :type_

      t.timestamps
    end
  end
end
