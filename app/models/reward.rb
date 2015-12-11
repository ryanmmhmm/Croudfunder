class Reward < ActiveRecord::Base
  has_many :pledges
  belongs_to :project



  def remaining
  	quantity - pledges.count
  end

end
