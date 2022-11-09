class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :regex, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :likes, [:user_id, :regex_id], unique:true
  end
end
