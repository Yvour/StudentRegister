class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :disciplines, :name, :unique=>true
  end
end
