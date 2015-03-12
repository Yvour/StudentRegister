class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.string :name
      t.integer :course

      t.timestamps null: false
    end
    add_index :student_groups, :name, :unique=>true
  end
end
