class Vote < ActiveRecord::Base
  validate :check_role
  validates_uniqueness_of :user_id, :scope => :candidate_id
  belongs_to :user
  belongs_to :candidate
  before_save :check_user

  def check_role
   	if !(user.role == 'Selector' || user.role == 'Voter')
	  errors.add(:role, "must be Selector or Visitor be in the past")
	end
  end

  def check_user
    self.voter_type = user.role
  end 

  def self.final_candidate
  	Candidate.update_all(selection_status: false)
    vote_result = Candidate.all.map{|c| [c.id ,c.votes.count]}
    result = vote_result.sort_by(&:last).reverse.first(2)
    result.map{|r| Candidate.find(r.first).update_attribute(:selection_status,true)}
  end
end
