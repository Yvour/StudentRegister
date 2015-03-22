class CreateLastNameSuffixes < ActiveRecord::Migration
  def change
    create_table :last_name_suffixes do |t|
      t.string :name

      t.timestamps null: false
    end
        add_index :last_name_suffixes, :name, :unique=>true
  end
end
