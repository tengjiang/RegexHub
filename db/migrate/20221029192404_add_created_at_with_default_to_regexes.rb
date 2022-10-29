class AddCreatedAtWithDefaultToRegexes < ActiveRecord::Migration
  def change
    add_column :regexes, :created_at, 'DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP'
  end
end
