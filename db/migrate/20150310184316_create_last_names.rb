class CreateLastNames < ActiveRecord::Migration
  def change
    create_table :last_names do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :last_names, :name, :unique=>true
  end
end
