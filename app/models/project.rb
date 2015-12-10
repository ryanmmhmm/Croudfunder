class Project < ActiveRecord::Base
  has_one :owner
  has_many :rewards

  validates :owner_id, presence: true
  validates :title, presence: true
  validates :funding_goal, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
  validates :category, presence: true

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
end
