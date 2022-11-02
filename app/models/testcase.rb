class Testcase < ActiveRecord::Base
  belongs_to :regex
  validates :content, presence: { message: "All regexes must have title!" }
  validates :match, presence: { message: "All regexes must specify expected match result!" }

end
