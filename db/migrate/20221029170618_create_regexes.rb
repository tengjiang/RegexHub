class CreateRegexes < ActiveRecord::Migration
  def change
    create_table :regexes do |t|
      t.string :title
      t.string :expression
      t.string :description
      t.string :tag
    end
  end
end
