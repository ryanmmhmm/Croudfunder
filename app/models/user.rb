class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :projects, through: :rewards, through: :pledges


  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true


  def total_pledge_amount
  	rewards.sum(:amount)
  end

  def total_projects_backed
  	projects.count(:id)
  end


end
