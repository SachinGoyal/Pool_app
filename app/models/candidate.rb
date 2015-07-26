class Candidate < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name, :age
  scope :final_candidate, -> { where(selection_status: true)}
  before_save :check_winner
  has_many :votes
  has_many :users, through: :votes

  def check_winner
    users = User.all
    users.each do |user|
      AppMailer.winner(user,candidate = self).deliver
    end
  end


end
