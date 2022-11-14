class AddUserIdToRegexes < ActiveRecord::Migration
  def change
    add_reference :regexes, :user, index: true, foreign_key: true
  end
end
