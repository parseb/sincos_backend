class Agenda < ApplicationRecord
  belongs_to :session
  has_many :tasks
end
