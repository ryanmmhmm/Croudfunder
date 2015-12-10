class Reward < ActiveRecord::Base
  has_many :users
  belongs_to :project
end
