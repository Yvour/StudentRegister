class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :first_name
      t.references :last_name
      t.string :first_name_value
      t.string :last_name_value
      t.date :birthdate
      t.string :email
      t.datetime :registration_time
      t.string :registration_ip
      t.references :student_group
      t.decimal    :average_grade_value, precision: 8, scale: 2
      t.timestamps null: false
    end
    add_index :students, :first_name_id
    add_index :students, [:last_name_id, :average_grade_value, :student_group_id], :name=>'complex_index' #too long with default name
    add_index :students, :registration_ip
    add_index :students, :student_group_id
    add_index :students, :average_grade_value
  end
end
