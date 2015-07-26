class Candidate < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name, :age
  scope :final_candidate, -> { where(selection_status: true)}
  
  has_many :votes
  has_many :users, through: :votes


end
