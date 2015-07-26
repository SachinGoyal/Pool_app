class VoteSchedule < ActiveRecord::Base
  after_save :send_mail_to_voter

  def send_mail_to_voter
    voters = User.voter
    voters.each do |voter|
      final_candidate = Candidate.final_candidate
      AppMailer.voter(final_candidate,voter,vote_schedule = self).deliver
    end
  end
end
