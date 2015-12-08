class Project < ActiveRecord::Base
  has_one :owner
  has_many :rewards
end
