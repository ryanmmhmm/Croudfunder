class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward
  has_one :project, through: :reward

  delegate :amount , to: :reward
  delegate :description, :title, to: :project

	validate :reward_remaining
  def reward_remaining
  	if reward.remaining <= 0
  		error.add(:reward_id, "All gone")
  	end

  end
end
