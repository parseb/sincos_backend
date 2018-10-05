class User < ApplicationRecord
  include Friendlyable

  has_one :vote, through: :tasks
end
