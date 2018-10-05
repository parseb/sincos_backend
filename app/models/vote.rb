class Vote < ApplicationRecord
  belongs_to :task
  has_one :user
end
