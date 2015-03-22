class CreateJoinTableLastNameLastNameSuffix < ActiveRecord::Migration
  def change
    create_join_table :last_names, :last_name_suffixes do |t|
       t.index [:last_name_id, :last_name_suffix_id]
       t.index [:last_name_suffix_id, :last_name_id]
    end
  end
end
