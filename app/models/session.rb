class Session < ApplicationRecord
  include Friendlyable
  validates_presence_of :name, :details #, :time
  has_many :tasks
  #belongs_to :user
end
