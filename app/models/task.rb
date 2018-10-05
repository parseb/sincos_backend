class Task < ApplicationRecord
  belongs_to :session
  has_many :votes
  has_many :users 
end
