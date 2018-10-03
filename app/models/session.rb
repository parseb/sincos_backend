class Session < ApplicationRecord
  validates_presence_of :name, :details #, :time  
end
