class User < ApplicationRecord
  include Friendlyable
  #has_many :sessions
  has_one :vote, through: :tasks
end
