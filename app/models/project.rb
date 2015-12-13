class Project < ActiveRecord::Base
  belongs_to :owner, class_name: User
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :users, through: :pledges

  validates :title, presence: true
  validates :funding_goal, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
  validates :category, presence: true

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def days_left
  	days_left = (end_date - Date.today).to_i

  	if days_left > 0
  		return days_left
  	else
  		return 0
  	end
  end

  def days_left_message
		days_left ? (days_left.to_s + ' days ') : 'Campaign Ended'
	end

  def self.random_project(size=1)
    Project.order("RANDOM()").first(size)
  end

  def backers
    pledges.count
  end

  def unique_backers
    self.users.uniq.count
  end

  def pledge_total
    pledges.sum(:amount)
  end

  def percent_funded
    pledge_total.to_f / funding_goal.to_f * 100.0
  end


  def self.top_three
      # Project.all.select{:self.percent_funded < 100}.sort{:self.percent_funded}.slice(3)

      projects_perecent_funded = []
      Project.all.each do |i|
        if i.days_left > 0
          projects_perecent_funded << i
        end
      end
        projects_perecent_funded.delete_if {|x| x.percent_funded >= 100}
        projects_perecent_funded.sort! { |x, y| y.percent_funded <=> x.percent_funded }
        projects_perecent_funded[0..2]
      # top_three = []
      # Project.all.each do |project|
      #   if project.percent_funded < 100
      #     top_three << project
      #   end
      # end
      # top_three.sort! do |a,b|
      # a.percent_funded <=> b.percent_funded
      # end
      # top_three
  end
end
