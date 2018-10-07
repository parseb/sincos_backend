class Session < ApplicationRecord
  include Friendlyable
  validates_presence_of :name, :details #, :time
  has_many :tasks
#   Gutentag::ActiveRecord.call self
#   #belongs_to :user
#
#   def tags_as_string
#     tag_names.join(", ")
#   end
#
# # Split up the provided value by commas and (optional) spaces.
#   def tags_as_string=(string)
#     self.tag_names = string.split(/,\s*/)
#   end

end
