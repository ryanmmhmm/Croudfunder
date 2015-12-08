class Reward < ActiveRecord::Base
  belongs_to :backer
  belongs_to :project
end
