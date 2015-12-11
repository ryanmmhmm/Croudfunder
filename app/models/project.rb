class Project < ActiveRecord::Base
  belongs_to :owner, class_name: User
  has_many :rewards
  has_many :pledges, through: :rewards

  validates :title, presence: true
  validates :funding_goal, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
  validates :category, presence: true

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def days_left
  	days_left = (end_date - Date.today).to_i

  	if days_left >= 0
  		return days_left
  	else
  		return false
  	end
  end

  def days_left_message
		days_left ? (days_left.to_s + ' days ') : 'Campaign Ended'
	end

  def self.random_project
    Project.order("RANDOM()").first
  end

  def backers
    pledges.count
  end

  def pledge_total
    pledges.sum(:amount)
  end

  def percent_funded
    pledge_total.to_f / funding_goal.to_f * 100.0
  end
end
