class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :student, index: true
      t.references :semester, index: true
      t.references :discipline, index: true
      t.decimal    :grade_value, precision: 8, scale: 2


      t.timestamps null: false
    end
    
    add_index :grades, :grade_value
    add_foreign_key :grades, :students
    add_foreign_key :grades, :semesters
    add_foreign_key :grades, :disciplines
  end
end
