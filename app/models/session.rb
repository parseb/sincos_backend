class Session < ApplicationRecord
  include Friendlyable
  validates_presence_of :name, :details #, :time
  has_many :tasks
end
