class Reward < ActiveRecord::Base
  has_many :pledges
  belongs_to :project



  def remaining
  	quantity - pledges.count
  end

  def reward_backer_count
  	pledges.count
  end

end
