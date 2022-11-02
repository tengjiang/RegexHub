class CreateTestcases < ActiveRecord::Migration
  def change
    create_table :testcases do |t|
      t.references :regex, index: true, foreign_key: true
      t.string :match
      t.string :content

      t.timestamps null: false
    end
  end
end
