class CreateFirstNames < ActiveRecord::Migration
  def change
    create_table :first_names do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :first_names, :name, :unique=>true
  end
end
