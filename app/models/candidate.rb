class Candidate < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name, :age
  
  has_many :votes
  has_many :users, through: :votes


end
